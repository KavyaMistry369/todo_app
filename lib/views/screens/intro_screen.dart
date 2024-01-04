import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/utils/route_utils.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding: EdgeInsets.all(16),child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.2,),
          Row(
            children: [Container(child: Image.asset("lib/views/assets/logo.png",width: 250,),),],),
            Row(children: [
               SizedBox(width: MediaQuery.of(context).size.width*0.1,),
               Text("Get Things Done.",style: GoogleFonts.poppins(color: Color.fromARGB(255, 68, 14, 163),fontSize: 25,fontWeight: FontWeight.bold),),
            ],)
            , SizedBox(height: 10,),
            Row(children: [
               SizedBox(width: MediaQuery.of(context).size.width*0.1,),
               Text("Just a click away from \n planning your tasks",style: GoogleFonts.poppins(fontSize: 15,),),
            ],),
            SizedBox(height: 20,),
        ],
      ),),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(102, 102, 246,100),
        onPressed: (){
          Navigator.of(context).pushNamed(Myroutes.login);
        },child: Icon(Icons.arrow_forward_ios,color: Colors.white,),),
    );
  }
}