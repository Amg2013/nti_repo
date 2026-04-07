import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_repo/core/app_theme.dart';
import 'package:nti_repo/features/auth/ui/bloc/login_bloc.dart';
import 'package:nti_repo/features/auth/ui/bloc/login_sates.dart';
import 'package:nti_repo/features/auth/ui/login_screen.dart';
import 'package:nti_repo/features/counter/ui/bloc/counter_bloc.dart';
import 'package:nti_repo/features/counter/ui/counter_screen.dart';
import 'package:nti_repo/features/home/bloc/tasks_manger_bloc.dart';
import 'package:nti_repo/features/home/ui/tasks_screen.dart';
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
      home: MultiBlocProvider(
        providers: [
          // BlocProvider(create: (_) => TasksMangerBloc() , ),
          BlocProvider(create: (_) => CounterBloc()),
          BlocProvider(create: (_) => LoginBloc(LoginInitialState())),
        ],
        child: TasksScreen(),
      ),

      //
      //  themeMode: switchTheme(),
      theme: AppTheme.lightTheme,

      // dark
      darkTheme: AppTheme.lightTheme,
    );
  }
}
