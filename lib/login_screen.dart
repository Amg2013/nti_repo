// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:nti_repo/firebase/auth_service.dart';
import 'package:nti_repo/firebase/auth_services_class.dart';
import 'package:nti_repo/statful_day/profile_screen.dart';
import 'package:nti_repo/widgets/auth_text_filed.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

final TextEditingController _usernameController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
        backgroundColor: Colors.blue,
      ),
      body: Center(child: Column(children: loginButton(context))),
    );
  }

  List<Widget> loginButton(BuildContext context) {
    return [
      Text('Welcome to the Login Screen!'),
      AuthTextFiled(
        keyboardType: TextInputType.name,
        obscureText: false,
        controller: _usernameController,
        hintText: 'username ',
      ),

      AuthTextFiled(
        controller: _passwordController,
        keyboardType: TextInputType.name,
        obscureText: true,
        hintText: 'password ',
      ),

      GestureDetector(
        onTap: () async {
          final email = _usernameController.text.trim();
          final password = _passwordController.text.trim();
          final userCredential =
              await AuthServicesClass.loginUseingEmailAndPassword(
                email: email,
                password: password,
              );
          if (userCredential != null && userCredential.user != null) {
            // User exists and login successful
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => ProfileScreen(
                      email: email,
                      username: email.split('@')[0],
                    ),
              ),
            );
          } else {
            // User does not exist or login failed

            AlertDialog(
              actions: [
                Text('Invalid email or password, or user does not exist.'),
              ],
            );
            //   _showErrorDialog(
            //     context,
            //     'Invalid email or password, or user does not exist.',
            //   );
            // }
          }
        },
        child: Container(
          height: 50,
          width: 100,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: const Text('Login'),
        ),
      ),
      // AuthTextFiled(hintText: 'password'),
    ];
  }
  /////////////////////////////////////////////////////////
  //////////////////////////Widgets///////////////////////////
  ///////////////////////////////////////////////////////////

  ///////////////////////////////////////////////////////////////////
  ///////////////////////////////// functions /////////////////////////////
  //////////////////////////////////////////////////////////

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Login Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
