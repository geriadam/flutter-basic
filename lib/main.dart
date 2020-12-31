import 'package:flutter/material.dart';
import 'MyApp.dart';
void main(){
  runApp(
    MaterialApp(
      title: "Transaction App",
      theme: ThemeData(
        primaryColor: Colors.teal,
        accentColor: Colors.pink
      ),
      home: MyApp(),
    )
  );
}