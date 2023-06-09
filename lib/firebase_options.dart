// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDddGt4MF6wwGRSvGZoFP-AMhiuTzSUkIU',
    appId: '1:814241275037:web:f3bec97f22638f45a60874',
    messagingSenderId: '814241275037',
    projectId: 'dmcflutter23',
    authDomain: 'dmcflutter23.firebaseapp.com',
    databaseURL: 'https://dmcflutter23-default-rtdb.firebaseio.com',
    storageBucket: 'dmcflutter23.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDvXvXQJ3mNoPRmIt6jdUMN6MEJY0Gfo0Q',
    appId: '1:814241275037:android:bdb3d8b92c438ec8a60874',
    messagingSenderId: '814241275037',
    projectId: 'dmcflutter23',
    databaseURL: 'https://dmcflutter23-default-rtdb.firebaseio.com',
    storageBucket: 'dmcflutter23.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBFmShEPQpa4exbyLUdSEO1S2UmanBE0zI',
    appId: '1:814241275037:ios:9e37051a287d6236a60874',
    messagingSenderId: '814241275037',
    projectId: 'dmcflutter23',
    databaseURL: 'https://dmcflutter23-default-rtdb.firebaseio.com',
    storageBucket: 'dmcflutter23.appspot.com',
    iosClientId: '814241275037-en9ivnt2pm8vgjo43pnh8ca3lscs4rv8.apps.googleusercontent.com',
    iosBundleId: 'com.example.consultaPrecos',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBFmShEPQpa4exbyLUdSEO1S2UmanBE0zI',
    appId: '1:814241275037:ios:9e37051a287d6236a60874',
    messagingSenderId: '814241275037',
    projectId: 'dmcflutter23',
    databaseURL: 'https://dmcflutter23-default-rtdb.firebaseio.com',
    storageBucket: 'dmcflutter23.appspot.com',
    iosClientId: '814241275037-en9ivnt2pm8vgjo43pnh8ca3lscs4rv8.apps.googleusercontent.com',
    iosBundleId: 'com.example.consultaPrecos',
  );
}
