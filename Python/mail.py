import os
import base64
import sys
from email.mime.text import MIMEText
from googleapiclient.discovery import build
from google.oauth2.credentials import Credentials

SCOPES = ['https://www.googleapis.com/auth/gmail.send']

def main():
    args = sys.argv
    sendEmail(args[1],args[2],args[3])

def getGmailService():
    creds = None
    if os.path.exists("tokenN.json"):
        creds = Credentials.from_authorized_user_file('tokenN.json', SCOPES)
    service = build('gmail', 'v1', credentials=creds)
    return service

def createMessage(to, subject, messageTxt):
    message = MIMEText(messageTxt)
    message['to'] = to
    message['from'] = "omgame733@gmail.com"
    message['subject'] = subject
    raw = base64.urlsafe_b64encode(message.as_bytes()).decode()
    return {'raw': raw}

def sendEmail(to, subject, messageTxt):
    service = getGmailService()
    message = createMessage(
        to,
        subject,
        messageTxt
    )
    sent = service.users().messages().send(userId='me', body=message).execute()
    print(f"Message sent! Id: {sent['id']}")
