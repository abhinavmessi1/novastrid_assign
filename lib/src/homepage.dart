import 'package:flutter/material.dart';
import './screen1.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * .99;
    var width = MediaQuery.of(context).size.width * .99;
    return Scaffold(
      body: containerOfmainPage(height: height, width: width),
    );
  }
}
