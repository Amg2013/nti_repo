import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nti_repo/firebase_options.dart';
import 'package:nti_repo/provider_day/provider_counter/counter_provider.dart';
import 'package:nti_repo/provider_day/provider_counter/counter_screen.dart';
import 'package:nti_repo/provider_day/theme/app_theme.dart';
import 'package:nti_repo/provider_day/theme/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CounterProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: AppTheme.darkTheme,
      theme: AppTheme.lightTheme,

      themeMode: Provider.of<ThemeProvider>(context).currentThemeMode,
      home: const CounterScreen(),
    );
  }
}
