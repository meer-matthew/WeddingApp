import 'package:flutter/material.dart';
import 'package:wedding_app_dart/screens/FormPage.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/images/wedding_background.png',
                ),
                fit: BoxFit.cover)),
        child: FormPage());
  }
}
