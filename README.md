Offline Registration
An app developed in Flutter with offline functionality using sqflite, sync service, and database storage.

Features
- Offline Data Storage: The app stores data locally when there is no internet connection.
- Automatic Syncing: Once the device's connection is restored, the app automatically sends the stored data to the server.
- Local Data Management: After syncing, the app clears the local storage to ensure efficient data management.

Technologies Used
- Flutter: For building the app.
- sqflite: For local database storage.
- Sync Service: To manage data synchronization between local storage and the server.
- Database Storage: For persistent data storage.
  
How It Works
1. Data Storage: When the app detects no internet connection, it saves the data locally using sqflite.
2. Connection Restoration: The app continuously checks for an internet connection.
3. Data Syncing: Once a connection is available, the app sends the locally stored data to the server.
4. Local Storage Cleanup: After successfully sending the data, the app automatically clears the local storage.

Setup and Installation
Clone the repository:
git clone  https://github.com/matheusbeezerra/offline_registration.git

Navigate to the project directory:
cd project-name

Install dependencies:
flutter pub get

Run the app:
flutter run

Contributing
Contributions are welcome! Please submit a pull request or open an issue to discuss what you would like to change.

Screens
![Captura de tela 2024-06-21 102308](https://github.com/matheusbeezerra/offline_registration_app/assets/77506878/e99b7434-5ac1-450a-8e4b-1d436af162b8)
![Captura de tela 2024-06-21 102330](https://github.com/matheusbeezerra/offline_registration_app/assets/77506878/edb45ec5-fa1f-46a4-82d7-cbd6bb4c27d0)
![Captura de tela 2024-06-21 102359](https://github.com/matheusbeezerra/offline_registration_app/assets/77506878/5fd36201-5cf6-4cf5-b056-d1bfc8b24735)

