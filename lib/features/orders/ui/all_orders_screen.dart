import 'package:flutter/material.dart';

class AllOrdersScreen extends StatefulWidget {
  int? x;

  List<Widget> list = List.generate(100, (index) => Text('Order $index'));
  AllOrdersScreen({super.key});

  @override
  State<AllOrdersScreen> createState() => _AllOrdersScreenState();
}

class _AllOrdersScreenState extends State<AllOrdersScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then(
      //
      (value) => setState(() {
        ///
        widget.x = 100;
      }),
    );
  }

  final List users = ['taha', 'mohamed', 'ahmed', 'omar'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (_, i) {
                return Card(child: ListTile(title: Text(users[i])));
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: TextButton(
              onPressed: () {
                users.add('Kiro');
                setState(() {});
              },
              child: Text('Add user'),
            ),
          ),
        ],
      ),
    );
  }
}
