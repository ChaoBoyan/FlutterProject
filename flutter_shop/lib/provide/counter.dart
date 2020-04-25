
import 'package:flutter/material.dart';

class Counter with ChangeNotifier{
  int value = 1;

  increament(){
    value ++;
    notifyListeners();
  }
}
