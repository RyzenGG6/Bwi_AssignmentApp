import 'package:flutter/material.dart';

class service extends StatelessWidget {
  final String imagePath;
  final String title;

  service({required this.imagePath, required this.title});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return  Container(
      height: 180,
      width: screenWidth-20,
      padding: EdgeInsets.only(left: 20,top: 20,right: 10),
      child: Card(
        // color: Colors.blueAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
              ),
              height: 100,
              // padding: EdgeInsets.only(left: 20, top: 10),
            ),

            Container(
              padding: EdgeInsets.only(top: 10, left: 20),
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}