import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import 'checkbox.dart';



void main() =>  runApp( ProviderScope(child:  MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      // home: TodoApp(),
      home: MyCheckBox(),
    );
  }
}