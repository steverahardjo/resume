import os
from google.oauth2.credentials import Credentials
from google.auth.transport.requests import Request
from googleapiclient.discovery import build
from googleapiclient.http import MediaFileUpload
from googleapiclient.errors import HttpError
from dotenv import load_dotenv

load_dotenv()

CLIENT_ID = os.environ.get('CLIENT_ID')
CLIENT_SECRET = os.environ.get('CLIENT_SECRET')
REFRESH_TOKEN = os.environ.get('REFRESH_TOKEN')
FOLDER_ID = os.environ.get("FOLDER_ID")

SCOPES = ['https://www.googleapis.com/auth/drive.file']

def get_service():
    """Builds the Drive service using User OAuth Refresh Token."""
    creds = Credentials.from_authorized_user_info({
        "client_id": CLIENT_ID,
        "client_secret": CLIENT_SECRET,
        "refresh_token": REFRESH_TOKEN,
        "token_uri": "https://oauth2.googleapis.com/token",
    }, SCOPES)

    if creds and creds.expired and creds.refresh_token:
        print("Status: Refreshing access token...")
        creds.refresh(Request())
        
    return build("drive", "v3", credentials=creds)

def clear_folder(service):
    """Trashes all files in the target folder to ensure a clean upload."""
    print(f"Action: Clearing folder {FOLDER_ID}")
    try:
        query = f"'{FOLDER_ID}' in parents and trashed = false"
        results = service.files().list(q=query, fields="files(id, name)").execute()
        items = results.get('files', [])

        if not items:
            print("Status: Folder is already empty.")
            return

        for item in items:
            print(f"Removing: {item['name']}")
            try:
                service.files().delete(fileId=item['id']).execute()
            except HttpError:
                service.files().update(fileId=item['id'], body={'trashed': True}).execute()
                
    except HttpError as error:
        print(f"Error: Cleanup failed: {error}")

def upload_pdfs(service):
    """Uploads all PDFs in the current directory."""
    files = [f for f in os.listdir('.') if f.endswith('.pdf')]
    
    if not files:
        print("Warning: No PDFs found in the local directory.")
        return

    for filename in files:
        print(f"Uploading: {filename}")
        file_metadata = {
            'name': filename,
            'parents': [FOLDER_ID]
        }
        media = MediaFileUpload(filename, mimetype='application/pdf')
        
        try:
            file = service.files().create(
                body=file_metadata,
                media_body=media,
                fields='id'
            ).execute()
            print(f"Success: File ID {file.get('id')}")
        except HttpError as error:
            print(f"Error: Upload failed for {filename}: {error}")

if __name__ == "__main__":
    try:
        if not all([CLIENT_ID, CLIENT_SECRET, REFRESH_TOKEN, FOLDER_ID]):
            print("Error: Missing OAuth credentials or Folder ID in environment variables.")
        else:
            drive_service = get_service()
            clear_folder(drive_service)
            upload_pdfs(drive_service)
            print("Process completed successfully.")
    except Exception as e:
        print(f"Critical Failure: {e}")