import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nti_repo/core/app_theme.dart';
import 'package:nti_repo/features/auth/ui/login_screen.dart';
import 'package:nti_repo/features/recommended/ui/screens/recommednd_properites.dart';
import 'package:nti_repo/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //
    //
    return MaterialApp(
      home: RecommedndProperites(),

      //
      //  themeMode: switchTheme(),
      theme: AppTheme.lightTheme,

      // dark
      darkTheme: AppTheme.lightTheme,
    );
  }
}
