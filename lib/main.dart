import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myspaces/myspaces_home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:myspaces/utils/constants.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    MaterialColor msThemeColor = MaterialColor(kThemeColour.value, const <int, Color>{
      50: kThemeColour,
      100: kThemeColour,
      200: kThemeColour,
      300: kThemeColour,
      400: kThemeColour,
      500: kThemeColour,
      600: kThemeColour,
      700: kThemeColour,
      800: kThemeColour,
      900: kThemeColour,
    });
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kThemeColour,
        primarySwatch: msThemeColor,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      home: const MySpacesHome(),
    );
  }
}
