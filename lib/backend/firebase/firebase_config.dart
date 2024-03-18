import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDVu9hdZOWqtAqHS7TRtqUJr-2bzk3kq1Q",
            authDomain: "rushd-fcba3.firebaseapp.com",
            projectId: "rushd-fcba3",
            storageBucket: "rushd-fcba3.appspot.com",
            messagingSenderId: "176429913580",
            appId: "1:176429913580:web:75612e962fa0e4b224dcc9"));
  } else {
    await Firebase.initializeApp();
  }
}
