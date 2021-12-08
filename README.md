# BasePay Mobile

Wage transparency for everyone, not just the rich!

## Installation

1. [Install Flutter](https://docs.flutter.dev/get-started/install) 
2. Installl either Android Studio or VSCode (VSCode is faster to work with!)
3. Install Flutter and Dart plugins for Android Studio or VSCode
4. Run `flutter doctor` and make sure everything is good

## Running the app

1. Add an empty .env file in the project's root directory (`touch .env`)
2. Add `GOOGLE_MAPS_API_KEY=<API KEY HERE>` to .env. Reach out to jagged91 on the BasePay discord for an API key to test with, or create one yourself in Google Cloud Console.
3. Open this project's root directory in your IDE of choice
4. Open `main.dart`
5. Choose a target device - either an emulator or a device plugged in
6. Run!

## Notes

* All sensitive keys / data should be stored in the `.env` file. There's a Flutter plugin (`flutter_config`) which reads this file - you can reference it in your dart code or native code.
* A thriving wage for everyone!!
