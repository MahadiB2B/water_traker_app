import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'homeScreen.dart';

class Water_Traker_App extends StatelessWidget {
  const Water_Traker_App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:HomeScreen(),
    );
  }
}
