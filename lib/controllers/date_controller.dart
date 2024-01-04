import 'package:flutter/material.dart';

class DateController extends ChangeNotifier{
  DateTime mydate=DateTime.now();
  DateTime mytime=DateTime.now();

  void changemydate ({required DateTime Date}){
    this.mydate=Date;
    notifyListeners();
  }

  void Changemytime({required DateTime time}){
    mytime=TimeOfDay.fromDateTime(time) as DateTime;
    notifyListeners();
  }

}