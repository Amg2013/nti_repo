import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_repo/features/counter/ui/bloc/counter_bloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  var counterValue = 0;
  @override
  Widget build(BuildContext context) {
    return
    // 4- bloc provider  and bloc consumer
    BlocBuilder<CounterBloc, CounterState>(
      //
      builder: (context, state) {
        //

        if (state is IncrementCounterByOneState) {
          ////
          ///
        } else if (state is DecrementCounterByOneState) {
          counterValue = counterValue - 1;
        } else if (state is IncrementCounterByTwoState) {
          counterValue = counterValue + 2;
        }

        //
        return Scaffold(
          appBar: AppBar(title: Text('Counter')),
          body: Center(child: Text('counter Value ${counterValue}')),

          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: () {
                  context.read<CounterBloc>().add(CounterIncrementEvent());
                },
                child: Icon(Icons.add),
              ),
              SizedBox(width: 16),
              FloatingActionButton(
                onPressed: () {
                  context.read<CounterBloc>().add(CounterDecrementEvent());
                },
                child: Icon(Icons.remove),
              ),
            ],
          ),
        );
      },
    );
  }
}
