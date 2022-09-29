import 'dart:async';
import './homescreen.dart';
import 'package:flutter/material.dart';

class LaunchScreen extends StatefulWidget {
  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {

  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds:5), (){
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => LandingPage(),
      ));
    });
  }

  // added test yourself
  // and made the text to align at center 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.blue[900],
      body: Center(
        child: Image.asset('images/spash.png'
        ),
      ),
    );
  }
}