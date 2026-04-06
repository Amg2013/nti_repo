import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nti_repo/features/auth/data/models/user_data_class.dart';
import 'package:nti_repo/features/auth/data/services/firebase_auth_secives.dart';
import 'package:nti_repo/features/home/ui/home_screen.dart';
import 'package:nti_repo/features/recommended/ui/screens/recommednd_properites.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Screen')),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 4- use Consumer or Provider.of to access the counter value from CounterProvider
              // and display it here
              const Text('You have pushed the button this many times:'),

              const SizedBox(height: 20),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed:
                          () => _signInInUiScreen(
                            UserDataClass(
                              email: _emailController.text,
                              name: _passwordController.text,
                            ),
                          ),
                      child: const Text('Login'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed:
                          () => _singUpInUiScreen(
                            UserDataClass(
                              email: _emailController.text,
                              name: _passwordController.text,
                            ),
                          ),
                      child: const Text('Sign Up'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _signInInUiScreen(UserDataClass userData) async {
    UserCredential? result = await FirebaseAuthServices.signIn(userData);

    result == null
        ? ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Login Failed', style: TextStyle(color: Colors.red)),
          ),
        )
        : _goToHomeScreen();
  }

  Future<void> _singUpInUiScreen(UserDataClass userData) async {
    //
    UserCredential? result = await FirebaseAuthServices.singUp(userData);

    //
    result == null
        ? ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Sign Up Failed',
              style: TextStyle(color: Colors.red),
            ),
          ),
        )
        : _goToHomeScreen();

    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(result)));
  }

  void _goToHomeScreen() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => RecommedndProperites()),
    );
  }

  ///
}
