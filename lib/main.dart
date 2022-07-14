// ignore_for_file: unused_import, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Pages/countries_list.dart';
import 'countriesModel.dart';
import 'Functions/functions.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyD5qaxKThShqcg17AhGZfogHiQMVJLAqF4",
        authDomain: "reiz-tech-homework.firebaseapp.com",
        projectId: "reiz-tech-homework",
        storageBucket: "reiz-tech-homework.appspot.com",
        messagingSenderId: "689302348317",
        appId: "1:689302348317:web:3202946512f0964e98dcf4",
        measurementId: "G-NCDEXMZXS3"),
  );
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  runApp(MaterialApp(
    title: 'Homework',
    theme: ThemeData(
      snackBarTheme: SnackBarThemeData(
        actionTextColor: Colors.white,
      ),
      textTheme: GoogleFonts.robotoTextTheme(),
    ),
    debugShowCheckedModeBanner: false,
    home: MainPage(),
  ));
}

//TODO: 4. Fix scroll issue on mobile devices
// 5. Fix Flex issue with title and buttons