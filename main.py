import os
import json
from google.oauth2.credentials import Credentials
from google.auth.transport.requests import Request
from googleapiclient.discovery import build
from googleapiclient.http import MediaFileUpload
from dotenv import load_dotenv

load_dotenv()

def get_drive_service():
    """Initializes the Drive service from a single JSON environment variable."""
    creds_raw = os.environ.get("GDRIVE_CREDENTIALS")
    
    if not creds_raw:
        raise ValueError("Error: GDRIVE_CREDENTIALS environment variable is missing.")

    try:
        # Parse the JSON and strip any accidental whitespace
        config = json.loads(creds_raw.strip())
        
        # Store folder_id globally for the upload functions
        global TARGET_FOLDER_ID
        TARGET_FOLDER_ID = config.get("folder_id")

        # OAuth2 Mapping
        info = {
            "client_id": config.get("client_id"),
            "client_secret": config.get("client_secret"),
            "refresh_token": config.get("refresh_token"),
            "token_uri": config.get("token_uri", "https://oauth2.googleapis.com/token"),
        }
        
        creds = Credentials.from_authorized_user_info(info, ['https://www.googleapis.com/auth/drive.file'])

        if creds and creds.expired and creds.refresh_token:
            print("Status: Refreshing access token...")
            creds.refresh(Request())
            
        return build("drive", "v3", credentials=creds)
    except json.JSONDecodeError:
        raise ValueError("Error: GDRIVE_CREDENTIALS is not valid JSON. Check for trailing commas.")

def sync_files(service):
    """Trashes remote files and uploads current local PDFs."""
    print(f"Action: Syncing to folder {TARGET_FOLDER_ID}")
    
    # 1. Cleanup
    try:
        query = f"'{TARGET_FOLDER_ID}' in parents and trashed = false"
        results = service.files().list(q=query, fields="files(id, name)").execute()
        for item in results.get('files', []):
            print(f"Removing: {item['name']}")
            service.files().delete(fileId=item['id']).execute()
    except Exception as e:
        print(f"Error: Directory cleanup failed: {e}")

    # 2. Upload
    pdfs = [f for f in os.listdir('.') if f.endswith('.pdf')]
    if not pdfs:
        print("Warning: No PDF files found in workspace.")
        return

    for filename in pdfs:
        print(f"Uploading: {filename}")
        metadata = {'name': filename, 'parents': [TARGET_FOLDER_ID]}
        media = MediaFileUpload(filename, mimetype='application/pdf')
        try:
            file = service.files().create(body=metadata, media_body=media, fields='id').execute()
            print(f"Success: Created file ID {file.get('id')}")
        except Exception as e:
            print(f"Error: Upload failed for {filename}: {e}")

if __name__ == "__main__":
    try:
        drive_service = get_drive_service()
        sync_files(drive_service)
        print("Process completed successfully.")
    except Exception as e:
        print(f"Critical Failure: {e}")