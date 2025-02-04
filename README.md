# Image Picker App

This Flutter app allows users to pick multiple images from their device storage using the `image_picker` package. The app displays the selected images in a grid-like view and allows users to upload more images.

## Features

- Allows users to pick multiple images.
- Displays the selected images in a scrollable view.
- Simple user interface with a button to trigger image selection.

## Requirements

- Flutter SDK
- Dart
- `image_picker` package (for picking images from the gallery)

## Installation

1. Clone the repository:

   ```bash
   git clone <repository-url>
## dependencies:
  flutter:
    sdk: flutter
  image_picker: ^0.8.5+3

## permissions:

```
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
<uses-permission android:name="android.permission.CAMERA"/>
<uses-permission android:name="android.permission.READ_MEDIA_IMAGES"/>
```
