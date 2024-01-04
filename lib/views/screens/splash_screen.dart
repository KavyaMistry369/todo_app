import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'dart:async';

import 'package:todo_app/utils/route_utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  MyTimer(){
    Timer.periodic(const Duration(seconds: 5), (timer) {
      Navigator.of(context).pushReplacementNamed(Myroutes.intro);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding: EdgeInsets.all(16),child:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Center(child:  Image.asset("lib/views/assets/logo.png",width: 300,),),
         Text("Tasker",style: TextStyle(color: Colors.deepPurple,fontSize: 32,fontWeight: FontWeight.bold),),
         SizedBox(height: 30,),
         CircularProgressIndicator()
        ],
      ),));;
  }
}