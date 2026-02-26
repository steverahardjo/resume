import os
from google.oauth2.credentials import Credentials
from google.auth.transport.requests import Request
from googleapiclient.discovery import build
from googleapiclient.http import MediaFileUpload
from googleapiclient.errors import HttpError
from dotenv import load_dotenv

load_dotenv()

# Configuration with automatic whitespace stripping
def get_env(key):
    val = os.environ.get(key)
    return val.strip() if val else None

CONFIG = {
    'CLIENT_ID': get_env('CLIENT_ID'),
    'CLIENT_SECRET': get_env('CLIENT_SECRET'),
    'REFRESH_TOKEN': get_env('REFRESH_TOKEN'),
    'FOLDER_ID': get_env('FOLDER_ID')
}

SCOPES = ['https://www.googleapis.com/auth/drive.file']

def get_service():
    """Initializes the Google Drive API service."""
    if not all(CONFIG.values()):
        missing = [k for k, v in CONFIG.items() if not v]
        raise ValueError(f"Missing variables: {', '.join(missing)}")

    creds = Credentials.from_authorized_user_info({
        "client_id": CONFIG['CLIENT_ID'],
        "client_secret": CONFIG['CLIENT_SECRET'],
        "refresh_token": CONFIG['REFRESH_TOKEN'],
        "token_uri": "https://oauth2.googleapis.com/token",
    }, SCOPES)

    if creds and creds.expired and creds.refresh_token:
        print("Status: Refreshing access token...")
        creds.refresh(Request())
        
    return build("drive", "v3", credentials=creds)

def clear_folder(service):
    """Trashes existing files in the target folder."""
    folder_id = CONFIG['FOLDER_ID']
    print(f"Action: Clearing folder {folder_id}")
    try:
        query = f"'{folder_id}' in parents and trashed = false"
        results = service.files().list(q=query, fields="files(id, name)").execute()
        items = results.get('files', [])

        if not items:
            print("Status: Folder is already empty")
            return

        for item in items:
            print(f"Removing: {item['name']}")
            service.files().delete(fileId=item['id']).execute()
    except Exception as e:
        print(f"Error: Cleanup failed: {e}")

def upload_pdfs(service):
    """Uploads PDF files found in the current directory."""
    files = [f for f in os.listdir('.') if f.endswith('.pdf')]
    if not files:
        print("Warning: No PDFs found in local directory")
        return

    for filename in files:
        print(f"Uploading: {filename}")
        metadata = {'name': filename, 'parents': [CONFIG['FOLDER_ID']]}
        media = MediaFileUpload(filename, mimetype='application/pdf')
        try:
            file = service.files().create(body=metadata, media_body=media, fields='id').execute()
            print(f"Success: File ID {file.get('id')}")
        except Exception as e:
            print(f"Error: Upload failed for {filename}: {e}")

if __name__ == "__main__":
    try:
        drive_service = get_service()
        clear_folder(drive_service)
        upload_pdfs(drive_service)
        print(f"Debug: CLIENT_ID length is {len(CONFIG['CLIENT_ID'] if CONFIG['CLIENT_ID'] else '')}")
        print("Process completed successfully.")
    except Exception as e:
        print(f"Critical Failure: {e}")