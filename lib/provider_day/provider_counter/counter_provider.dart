import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  // 1- Data filed that the provider will manage
  int counter = 0;

  //2- Methods to manipulate the data
  void incerment() {
    counter++;
    notifyListeners();
  }
}
