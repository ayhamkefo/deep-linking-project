Flutter Deep Linking Demo App

This Flutter application demonstrates deep linking using both:

Android App Links (HTTPS)

Custom URL scheme (productapp://)

It works with a simple Node.js + Express backend to serve product data and the assetlinks.json required for Android App Links verification.

✨ Features

Product list & product detail screen

Handles deep links via HTTPS (Android App Links)

Handles deep links via custom scheme (productapp://)

Works in both debug and release builds (update SHA-256 for release)

Fully configurable backend URL


📦 Requirements

Flutter SDK ≥ 3.0

Dart ≥ 3.0

Android Studio or VS Code

Android device or emulator

Backend server running (see Backend Repo: https://github.com/ayhamkefo/deep-linking-server)


🚀 Installation & Setup

Clone the repo

git clone https://github.com/ayhamkefo/deep-linking-project.git

cd deep-linking-project

Install dependencies

flutter pub get

Update the backend host in urls.dart

Ensure your backend is running and serving assetlinks.json at:

https://<your-domain>/.well-known/assetlinks.json

▶️ Running the App

flutter run

Testing deep links


📌 Notes
For debug builds, use your debug SHA-256 in assetlinks.json

For release builds, update assetlinks.json with the release key SHA-256

iOS Universal Links setup is similar but requires apple-app-site-association file
