import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/utils/route_utils.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding: EdgeInsets.all(16),child: SingleChildScrollView(child: Column(
        children: [
 Center(child:  Image.asset("lib/views/assets/logo.png",width: 200,),),
               SizedBox(height:10,),
               Text("Welcome Back !",style: GoogleFonts.poppins(color: Color.fromRGBO(4, 4, 158, 0.612),fontSize: 25,fontWeight: FontWeight.bold),),
       SizedBox(height:30,),
      Container(
        padding: EdgeInsets.all(20),
        child:  TextField(
          style: GoogleFonts.poppins(),
        decoration: InputDecoration(
          fillColor: Colors.deepPurple.shade100,
          hintText: "Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25)),
        ),
       ),),
       Container(
        padding: EdgeInsets.all(20),
        child:  TextField(
          style: GoogleFonts.poppins(),
        decoration: InputDecoration(
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25)),
        ),
       ),),
       SizedBox(height: 30,),
       Container(
        height: 70,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
           color: Color.fromRGBO(39, 39, 252, 0.612),
        ),
        alignment: Alignment.center,
        child: Text("Login",style: GoogleFonts.poppins(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
       ),
       SizedBox(height: 50,),
       Text("or log in with",style: GoogleFonts.poppins(),),
       SizedBox(height: 20,),
       Image.asset("lib/views/assets/g.png",width:50,),
       SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Text("Don't have an account?"),
           TextButton(onPressed: (){
            Navigator.of(context).pushNamed(Myroutes.signup);
           }, child:Text("Get Started !",style: GoogleFonts.poppins(color: Color.fromRGBO(39, 39, 252, 0.612)),))
        ],),
        ],
      ),)),
    );
  }
}