import 'package:flutter/material.dart';
import 'package:projects/utilities/app_colors.dart';
import 'package:projects/views/messaging.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: kAppBgColor,
        primarySwatch: Colors.blue,
      ),
      home: const Messaging(),
    );
  }
}

