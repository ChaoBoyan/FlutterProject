
import 'package:flutter/material.dart';

class Counter with ChangeNotifier{
  int value = 1;

  int selectIndex = 0;

  increament(){
    value ++;
    notifyListeners();
  }

  changeSelectIndex(int index){
    selectIndex = index;
    notifyListeners();
  }
}
