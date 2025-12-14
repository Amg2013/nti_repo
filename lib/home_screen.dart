import 'package:flutter/material.dart';
import 'package:nti_repo/statful_day/profile_screen.dart';
import 'package:nti_repo/widgets/auth_text_filed.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final TextEditingController _usernameController = TextEditingController();

final TextEditingController _passwordController = TextEditingController();

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),

        backgroundColor: Colors.blue,
      ),
      body: Center(child: Column(children: loginButton(context))),
    );
  }

  List<Widget> loginButton(BuildContext context) {
    return [
      Text('Welcome to the Home Screen!'),
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
        onTap: () => _onLoginTap(context),

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
  void _onLoginTap(conext) {
    setState(() {
      if (_usernameController.text.trim() == 'admin' &&
          _passwordController.text.trim() == '1234') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfileScreen()),
        );
      }
      debugPrint('login pressed  ddddddddddddddddd');
    });
  }
}
