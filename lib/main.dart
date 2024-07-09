import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:ezygo/Pages/rolepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EzyGO',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        inputDecorationTheme: const InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 3, color: Colors.lightGreen),
              borderRadius: BorderRadius.all(Radius.circular(30))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 3, color: Colors.lightGreen),
              borderRadius: BorderRadius.all(Radius.circular(30))),
        ),
      ),
      home: const RolePage(),
    );
  }
}
