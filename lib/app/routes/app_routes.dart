import 'package:flutter/material.dart';

///simple navigation utility class
class AppRoutes {
  AppRoutes._();

  //push a new route onto the stack
  static void push(BuildContext context, Widget page){
    Navigator.push(context, MaterialPageRoute(builder: (_) => page));
  }

  //replace current route with a new one
  static void pushReplacement(BuildContext context, Widget page){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>page));
  }


  //push a new route and remove all previous routes
  static void pushAndRemoveUntil(BuildContext context, Widget page){
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_)=>page),
      (route) => false
    );
  }

  //pop the current route
  static void pop(BuildContext context){
    Navigator.pop(context);
  }

  //pop to first route(root)
  static void popToFirst(BuildContext context){
    Navigator.popUntil(context, (route)=>route.isFirst);
  }
}