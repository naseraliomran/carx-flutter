# CarX Flutter Application

CarX is a multi-role vehicle services application built with [Flutter](https://flutter.dev/). The project uses the [GetX](https://pub.dev/packages/get) package for state management and routing, and integrates Google Maps for location-based features.

## Project Overview

The application includes several dashboards for different types of users (admin, manager, salesman, and workshop). Screens are provided for buying or selling cars, viewing companies, and locating workshops on a map. Assets and fonts are included to provide a full Arabic user interface.

## Setup

1. Install [Flutter](https://docs.flutter.dev/get-started/install) (Dart SDK `>=3.0.0 <4.0.0`).
2. Clone this repository and change into the project directory:

   ```bash
   git clone <repository-url>
   cd carx-flutter
   ```

3. Fetch project dependencies:

   ```bash
   flutter pub get
   ```

4. Connect a device or start an emulator and run the app:

   ```bash
   flutter run
   ```

### Custom API host

The application uses `ApiConfig.baseUrl` (see `lib/config/api_config.dart`) to
determine the backend server. By default this is
`http://10.0.2.2:8000` for local development. To point the app at a different
host, provide an `API_BASE_URL` value when running or building:

```bash
flutter run --dart-define=API_BASE_URL=https://your-public-host.com
```

You can pass the same `--dart-define` flag to `flutter build` commands to embed
your public host in release builds.

## Usage

After launching, sign up or log in to explore the various dashboards. Use the menus to navigate between features such as car management, workshop locations, and user account settings. The app demonstrates integration with Google Maps as well as a basic multi-user workflow.

## License

This project is licensed under the [MIT License](LICENSE).

## Account Page

- Switch between English and Arabic languages.
- Toggle light and dark themes with animation.
- Update your password securely.
- Change displayed currency between IQD and USD.
