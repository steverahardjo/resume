import os
import json
from google.oauth2.credentials import Credentials
from google.auth.transport.requests import Request
from googleapiclient.discovery import build
from googleapiclient.http import MediaFileUpload

# 1. Configuration Constants
CREDENTIALS_FILE = 'credentials.json'
TARGET_FOLDER_ID = None  # Will be populated from JSON

def get_drive_service():
    """Initializes the Drive service from a local JSON file."""
    global TARGET_FOLDER_ID
    
    if not os.path.exists(CREDENTIALS_FILE):
        raise FileNotFoundError(f"Error: {CREDENTIALS_FILE} not found in the current directory.")

    try:
        with open(CREDENTIALS_FILE, 'r') as f:
            config = json.load(f)
        
        # Extract Folder ID
        TARGET_FOLDER_ID = config.get("folder_id")
        if not TARGET_FOLDER_ID:
            raise ValueError(f"Error: 'folder_id' key missing from {CREDENTIALS_FILE}")

        # Map OAuth2 info
        info = {
            "client_id": config.get("client_id"),
            "client_secret": config.get("client_secret"),
            "refresh_token": config.get("refresh_token"),
            "token_uri": config.get("token_uri", "https://oauth2.googleapis.com/token"),
        }
        
        creds = Credentials.from_authorized_user_info(info, ['https://www.googleapis.com/auth/drive.file'])

        # Refresh if necessary
        if creds and creds.expired and creds.refresh_token:
            print("Status: Refreshing access token...")
            creds.refresh(Request())
            
        # Return the actual service object
        return build("drive", "v3", credentials=creds)

    except json.JSONDecodeError:
        raise ValueError(f"Error: {CREDENTIALS_FILE} contains invalid JSON formatting.")

# --- Execution Block ---
if __name__ == "__main__":
    try:
        # Assign the returned service to a variable
        service = get_drive_service()
        print("Success: Connected to Google Drive.")
        
        # Now you can call your sync function:
        # sync_files(service) 
        
    except Exception as e:
        print(f"Critical Failure: {e}")