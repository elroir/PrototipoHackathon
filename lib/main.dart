

import 'package:flutter/material.dart';

import 'package:prototipohackathon/src/app.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prototipo Hackathon',
      home: AppMain(),
    );
  }
}


