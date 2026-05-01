// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_repo/features/home/home_screen.dart';
import 'package:nti_repo/firebase_options.dart';
import 'package:nti_repo/utils/app_themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

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
      home: HomeScreen(),

      //1 theme data
      // theme mode dark , light
      // theme
      theme: AppThemes.darkTheme,
      // darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.light,
    );
  }
}
