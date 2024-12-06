
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'dart:async';

import 'package:todo_app/views/listscreen/list_screen.dart'; 

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

   
    Timer(Duration(seconds: 3), () {
   
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ListScreen()), 
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, 
      body: Center(
        child: Lottie.asset(
          'assets/videoplayerr.json', 
          width: 200,  
          height: 200, 
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Screen")),
      body: const Center(child: Text("Welcome to the Home Screen")),
    );
  }
}
