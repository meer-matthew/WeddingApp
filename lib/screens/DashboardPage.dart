import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  final String name;
  final String relationship;
  final String message;

  Dashboard({this.name, this.relationship, this.message});
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
