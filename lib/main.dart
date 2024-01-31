import 'package:flutter/material.dart';
import 'package:todo_app/home.dart';

void main(){
  runApp(MyApp());
}
// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Home() ,
    );
  }
}