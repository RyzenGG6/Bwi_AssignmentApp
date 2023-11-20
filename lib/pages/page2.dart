import 'package:bwi_intern/Firebase/firebase.dart';
import 'package:flutter/material.dart';

class page2 extends StatefulWidget {
  const page2({super.key});

  @override
  State<page2> createState() => _page2State();
}

class _page2State extends State<page2> {
  @override
  void initState() {
    // TODO: implement initState
    _fetchImageUrl();
    super.initState();
  }
  String url='';
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body:
      Container(
        height: 300,
        width:screenWidth-20,
        // padding: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),

        ),
        child:  Image.network(
         url
          ,
          height: 200,
          width: screenWidth - 20,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
  Future<void> _fetchImageUrl() async {
    try {
      String Url = await getImageUrl('banner2.jpg');
      setState(() {
        url = Url;
      });
    } catch (e) {
      print('Error fetching image URL: $e');
      // Handle the error as needed
    }
  }
}
