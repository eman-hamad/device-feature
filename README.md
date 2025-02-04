## Flutter App: Device Features Integration

📌 Overview

This Flutter application integrates various device features, including:

Google Maps with a marker on Cairo, Egypt 🗺️

Image Picker to select multiple images from the gallery 📷

Biometric Authentication using fingerprint login 🔒

 ## 📂 Features

1️⃣ Google Maps Integration

Displays a Google Map with a red marker on Cairo, Egypt.

Requires Google Maps API key.

2️⃣ Image Picker

Allows users to select multiple images from the gallery.

Displays selected images in a scrollable list.

3️⃣ Biometric Authentication

When the profile icon is pressed, it prompts for a fingerprint scan before accessing the profile.

The profile page contains the user's image, full name, and email.

##  🚀 Setup Instructions

🔑 1. Get a Google Maps API Key

Go to Google Cloud Console.

Create a new project.

Enable Google Maps SDK for Android.

Generate an API Key.

Add it to AndroidManifest.xml:

<meta-data
    android:name="com.google.android.geo.API_KEY"
    android:value="YOUR_API_KEY_HERE"/>

📦 2. Install Dependencies

Run the following command:

flutter pub get

⚙️ 3. Permissions (Android)

Add these permissions to AndroidManifest.xml:

<uses-permission android:name="android.permission.INTERNET"/>
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
<uses-permission android:name="android.permission.USE_BIOMETRIC"/>

📱 4. Run the App

Use this command to launch the app:

flutter run

## 📜 Dependencies Used

google_maps_flutter → Google Maps integration

image_picker → Select images from the gallery

local_auth → Biometric authentication

Install them using:

```
flutter pub add google_maps_flutter image_picker local_auth
```
