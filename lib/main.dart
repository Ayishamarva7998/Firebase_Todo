import 'package:flutter/material.dart';
import 'package:todo_app/home.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  Widget build(BuildContext context){
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Home() ,
    );
  }
}