import 'package:flutter/material.dart';
import 'package:nti_repo/provider_day/provider_counter/counter_provider.dart';
import 'package:nti_repo/provider_day/theme/theme_provider.dart';
import 'package:provider/provider.dart';

// todo provider counter screen
// 1- create CounterProvider class extends ChangeNotifier (and implement increment and decrement methods)
// 2- proivid the CounterProvider in in the widget tree using ChangeNotifierProvider
// 3- use Consumer or Provider.of to access the CounterProvider in the CounterScreen
class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter with Provider')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You have pushed the button this many times:${context.watch<CounterProvider>().counter}',
            ),

            // 4- use Consumer or Provider.of to access the counter value from CounterProvider
            // and display it here
            Text('You have pushed the button this many times:'),
            Container(
              height: 100,
              width: 100,

              child: Center(
                child: Text(
                  '${context.watch<CounterProvider>().counter}',
                  style: const TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
            ),
            Switch(
              value: context.watch<ThemeProvider>().isDark,
              onChanged: (value) {
                context.read<ThemeProvider>().changTheme(value);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CounterProvider>().incerment();
          // 5- use Consumer or Provider.of to access the increment method from CounterProvider
          // and call it here
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
