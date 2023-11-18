import 'package:flutter/material.dart';

class page2 extends StatefulWidget {
  const page2({super.key});

  @override
  State<page2> createState() => _page2State();
}

class _page2State extends State<page2> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body:
      Container(
        height: 300,
        width:screenWidth-20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),

        ),
        child:  Image.asset(
          'Assets/images/filter icon.png',

        ),
      ),
    );
  }
}
