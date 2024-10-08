
# Mobile Application for Tracking Event Participants

## Overview

This mobile application is designed to track event participants and provide an administrative panel with a dashboard for various summaries. The application is built using Flutter for the frontend, Firebase for backend services, and NoSQL for data storage. Git is used for version control.

## Features

- **Participant Tracking**: Track the attendance and activities of event participants.
- **Administrative Panel**: Manage events, participants, and other administrative tasks.
- **Dashboard**: View summaries and analytics related to events and participants.

## Technologies Used

- **Flutter**: A UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase.
- **Firebase**: A comprehensive app development platform that provides backend services, easy-to-use SDKs, and ready-made UI libraries.
- **NoSQL**: A type of database that is designed to accommodate a wide variety of data models, including key-value, document, columnar, and graph formats.
- **Git**: A distributed version control system for tracking changes in source code during software development.

## Getting Started

### Prerequisites

- Flutter SDK installed on your machine.
- Firebase project set up with necessary configurations.
- NoSQL database configured (e.g., Firestore).
- Git installed for version control.

### Installation

1. Clone the repository:

    ```bash
    git clone https://github.com/msdbouady/mytaber.git
    cd event-tracker
    ```

2. Install dependencies:

    ```bash
    flutter pub get
    ```

3. Configure Firebase:

    - Create a Firebase project and enable Firestore.
    - Download the `google-services.json` (for Android) and `GoogleService-Info.plist` (for iOS) files and place them in the respective directories (`android/app` and `ios/Runner`).
    - Update the Firebase configuration in the project.

4. Run the application:

    ```bash
    flutter run
    ```

## Project Structure

```
mytaber/
├── android/
├── ios/
├── lib/
|   ├── responsive.dart
|   ├── firebase_options.dart
│   ├── models/
|   ├── screen/
|   ├── service/
│   ├── screens/
├── main.dart
│   ├── services/
│   ├── widgets/
├── test/
├── pubspec.yaml
├── README.md
```

## Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository.
2. Create a new branch for your feature or bug fix.
3. Make your changes and commit them with descriptive messages.
4. Push your branch to your fork.
5. Create a pull request to the main repository.

## License

This is free.

## Contact

For any questions or support, please contact `msbouady@gmail.com`.
