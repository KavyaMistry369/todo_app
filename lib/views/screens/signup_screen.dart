import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/helpers/login_helper.dart';
import 'package:todo_app/helpers/task_helper.dart';
import 'package:todo_app/utils/route_utils.dart';
import 'package:todo_app/modals/user_modal.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding: EdgeInsets.all(16),child: SingleChildScrollView(child: Column(
        children: [
 Center(child:  Image.asset("lib/views/assets/logo.png",width: 200,),),
               SizedBox(height:10,),
               Text("Let's Get Started !",style: GoogleFonts.poppins(color: Color.fromRGBO(4, 4, 158, 0.612),fontSize: 25,fontWeight: FontWeight.bold),),
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
        child: Text("Sign Up",style: GoogleFonts.poppins(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
       ),
       SizedBox(height: 50,),
       Text("or log in with",style: GoogleFonts.poppins(),),
       SizedBox(height: 20,),
       GestureDetector(
        onTap: ()async{
          UserModal account = (await LoginHelper
                                  .login_helper
                                  .signin_with_google());
                              if (account.Email != "") {
                                TaskHelper.taskHelper.CreateUserRoom(Email: account.Email);
                                Navigator.of(context).pushReplacementNamed(Myroutes.home,arguments: account);
                              }
        },
        child: Image.asset("lib/views/assets/g.png",width:50,),),
       SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Text("Already an account?"),
           TextButton(onPressed: (){
            Navigator.of(context).pushNamed(Myroutes.login);
           }, child:Text("Log in !",style: GoogleFonts.poppins(color: Color.fromRGBO(39, 39, 252, 0.612)),))
        ],),
        ],
      ),)),
    );
  }
}