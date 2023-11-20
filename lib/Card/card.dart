import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String price;

  MyCard({required this.imagePath, required this.title, required this.price});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 250,
      width: 240,
      padding: EdgeInsets.only(left: 20,top: 20),
      child: Card(
        // color: Colors.blueAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0),
              ),
              child: Container(
                child: Image.network(
                  imagePath,
                  fit: BoxFit.cover,
                ),
                height: 150,
                // padding: EdgeInsets.only(left: 20, top: 10),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20, left: 20),
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),  Container(
              padding: EdgeInsets.only(top: 8, left: 20),
              child: Text(
                price,
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