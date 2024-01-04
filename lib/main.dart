import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controllers/date_controller.dart';
import 'package:todo_app/controllers/page_controller.dart';
import 'package:todo_app/utils/route_utils.dart';
import 'package:todo_app/views/screens/calendar_screen.dart';
import 'package:todo_app/views/screens/home_screen.dart';
import 'package:todo_app/views/screens/intro_screen.dart';
import 'package:todo_app/views/screens/login_screen.dart';
import 'package:todo_app/views/screens/signup_screen.dart';
import 'package:todo_app/views/screens/task_screen.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/views/screens/splash_screen.dart';

void  main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => pageController()),
      ChangeNotifierProvider(create: (context) => DateController()),
    ],child: MyApp(),)
  );
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Color.fromRGBO(102, 102, 246,100),
        useMaterial3: true,
      ),
      routes: {
        '/':(context) => const IntroScreen(),
        Myroutes.intro:(context) => const IntroScreen(),
        Myroutes.login:(context) => const LoginScreen(),
        Myroutes.signup:(context) => const SignUpScreen(),
        Myroutes.home:(context) => const HomeScreen(),
        Myroutes.task:(context) => const TaskScreen(),
        Myroutes.cal:(context) => const CalendarScreen(),
      },
    );
  }
}