
# fiery-flutter-prototype-archi

[![style: lint](https://img.shields.io/badge/style-lint-4BC0F5.svg)](https://pub.dev/packages/lint)

Updating architecture samples

console.firebase.google.com setup steps for new projects
that may be missed depending on version, docs, platform

Flutter web

## 1. Set up a Firebase account

## 2. Set up a Firebase project

## 3. Set up Firebase web config <https://console.firebase.google.com/u/0/project/settings/general/web>

  1. i.e. <https://console.firebase.google.com/u/0/project/{your-project-name}/settings/general/web>
  2. Note the URL digit `u/{your-digit}` `0` likely indicates your first logged-in priority Google account

## 4. Set up Firebase auth

  1. Set up email, anonymous sign-in (for initial demo purposes only)
  2. This deters ambiguous errors further down the track that may be unknown due to Flutter context, Flutter for web context or other bleeding-edge/deprecated environmental factors
  
## 5. Set up Firestore

  1. Create a collection with the given sample collection ID (in demo app source code)
  2. Allow demo collection access security rules

## 6. Set up Flutter **web** usage of Firebase
  
  1. Follow same Firebase cli setup steps
  2. Add script sources and config to body, taken from web app setup here: <https://console.firebase.google.com/u/0/project/{your-project-name}/settings/general/web>

  ```html
<!-- The core Firebase JS SDK is always required and must be listed first -->
<script src="https://www.gstatic.com/firebasejs/8.4.1/firebase-app.js"></script>
<script src="https://www.gstatic.com/firebasejs/8.4.1/firebase-analytics.js"></script>
<script src="https://www.gstatic.com/firebasejs/8.4.1/firebase-auth.js"></script>
<script src="https://www.gstatic.com/firebasejs/8.4.1/firebase-firestore.js"></script>

<!-- Firebase Configuration -->
<script>
    const firebaseConfig = {
        apiKey: "AIblahbalbhaasdjsaoisajd-asdoidaosadasd",
        authDomain: "{your-project-name}.firebaseapp.com",
        projectId: "{your-project-name}",
        storageBucket: "{your-project-name}.appspot.com",
        messagingSenderId: "{your-project-sendingID}",
        appId: "1:123213232312312:web:23123213213123321",
        measurementId: "G-23123213GG"
    };

    // Initialize Firebase
    firebase.initializeApp(firebaseConfig);
    // Initialize Analytics
    firebase.analytics();
</script>
  ```
  
  The above includes Firebase core, Analytics, Auth and Firestore. Similar script source lines may be added per FlutterFire for Web [documentation](https://firebase.flutter.dev/docs/installation/web)

  Example Firebase Auth web-only instructions for SDK: <https://firebase.flutter.dev/docs/auth/overview#3-web-only-add-the-sdk>
