## Audio Recorder and Player in Flutter

This Flutter app allows users to record and play audio using flutter_sound, path_provider, and permission_handler packages.

## Features

Record audio and save it to a local directory.

Play the recorded audio.

Request microphone permissions.

## Dependencies

Ensure you have the following dependencies in your pubspec.yaml file:

dependencies:
  flutter:

```
    sdk: flutter
  flutter_sound: ^9.2.13
  path_provider: ^2.0.15
  permission_handler: ^11.0.1
```

Setup Instructions

Clone the repository

```
git clone <repository_url>
cd <project_directory>
```

Install dependencies

```
flutter pub get

Run the application

flutter run
```

## Android Configuration

Ensure you have added microphone permissions in AndroidManifest.xml:

```
<uses-permission android:name="android.permission.RECORD_AUDIO" />
```

For Android 10+ (Scoped Storage), add the following inside <application> tag:

```

<queries>
    <package android:name="com.android.providers.media" />
</queries>
```

iOS Configuration

For iOS, add the following to ios/Runner/Info.plist:

```
<key>NSMicrophoneUsageDescription</key>
<string>We need access to the microphone to record audio.</string>
```

## Usage

Start Recording

Press the Record Audio button to start recording.

Stop Recording

Press Stop Recording to stop and save the audio file.

Play Recorded Audio

Press the Play Audio button to listen to the recorded file.

## Troubleshooting

Ensure microphone permissions are granted.

If facing issues on Android, run:

flutter clean
flutter pub get

If the app crashes, ensure the dependencies are correctly installed and up to date.
