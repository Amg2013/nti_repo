//1- events      //  +    -   =
//2- states     // +1   -1    +2
//3- bloc
// 4 - bloc provider  and bloc builder
// 5- ui

import 'package:flutter_bloc/flutter_bloc.dart';

class CounterEvent {}

class CounterIncrementEvent extends CounterEvent {}

class CounterDecrementEvent extends CounterEvent {}

/// 2
/// states
class CounterState {
  int counterValue = 0;
}

class IncrementCounterByOneState extends CounterState {}

class DecrementCounterByOneState extends CounterState {}

class IncrementCounterByTwoState extends CounterState {}

/// 3- bloc
///
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState()) {
    on<CounterIncrementEvent>((event, emit) {
      ///
      ///
      ///
      ///
      //// if ( )
      ///emait
      ///
      ///els em it error
      ///
      /////
      emit(IncrementCounterByOneState());
    });

    on<CounterDecrementEvent>((event, emit) {
      ///
      emit(DecrementCounterByOneState());
    });
  }
  //
}
