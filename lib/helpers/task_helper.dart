import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';

class TaskHelper {

  TaskHelper._();
  static final taskHelper = TaskHelper._();

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String roomCollection="UserTask";
  Logger? logger;

  // create
  Future<void> CreateUserRoom({required String Email}){
    String taskCollection="Tasks";
    Map<String,dynamic>data={
      'task':"",
      'Date':"",
      'Time':"",
    };
    logger?.i("CREATED USER ROOM SUCCESSFULLY");
   return firestore.collection(roomCollection).doc(Email).collection(taskCollection).doc().set(data);
  }

  void AddUserTasks(){}

}