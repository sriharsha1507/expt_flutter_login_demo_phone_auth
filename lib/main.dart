import 'package:flutter/material.dart';
import 'package:login_demo_phone_auth/LoginPage.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Phone Auth Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginPage(),
    );
  }
}
