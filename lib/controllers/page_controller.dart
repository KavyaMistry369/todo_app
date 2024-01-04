import 'package:flutter/material.dart';

class pageController extends ChangeNotifier{

  int pageIndex=0;
  PageController pagecontroller = PageController(initialPage: 0);

  void ChnagePageIndex({required int index}){
    pagecontroller.animateToPage(pageIndex, duration: Duration(milliseconds: 600), curve: Curves.linear);
    pageIndex=index;
    notifyListeners();
  }


}