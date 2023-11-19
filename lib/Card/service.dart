import 'package:flutter/material.dart';

class service extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final double distance;
  final double rating;
  final double reviews;

  service({
    required this.imagePath,
    required this.title,
    this.description = '',
    this.distance = 0.0,
    this.rating = 0.0,
    this.reviews = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 200,
      width: screenWidth - 20,
      padding: EdgeInsets.only(left: 20, top: 20, right: 10),
      child: Card(
        color: Colors.blueAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Curved square image
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0),
                ),
                child: Image.asset(
                  imagePath,
                  height: 150,
                  width: 100,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            // Vertical space between image and text
            SizedBox(width: 10),

            // Text content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(

                    child: Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    padding: EdgeInsets.only(top: 20),
                  ),
                  SizedBox(height: 5),
                  Text(description),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(Icons.location_on),
                      SizedBox(width: 5),
                      Text('${distance.toStringAsFixed(2)} km'),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(Icons.star,color: Colors.orange.shade300,),
                      SizedBox(width: 5),
                      Text('${rating.toStringAsFixed(1)} | ${reviews.toStringAsFixed(2)} Reviews'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
