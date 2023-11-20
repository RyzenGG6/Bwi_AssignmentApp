import 'package:bwi_intern/Card/card.dart';
import 'package:bwi_intern/Card/category_card.dart';
import 'package:bwi_intern/Firebase/firebase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class category_page extends StatefulWidget {
  const category_page({super.key});

  @override
  State<category_page> createState() => _category_pageState();


}

class _category_pageState extends State<category_page> {
  String purl='',purl1='',purl2='',purl3='',purl4='',purl5='',purl6='',purl7='',purl8='';
  String link1 = '';
  String title1 = '';
  String title2 = '';
  String title3 = '';
  String title4 = '';
  String title5 = '';
  String title6 = '';
  String title7 = '';
  String title8 = '';
  String title9 = '';


  @override
  void initState() {
    // TODO: implement initState
_fetchImageUrl();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('banner').snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // While the Future is still loading
            return Center(
                child: Container(
                    padding: EdgeInsets.all(30),
                    child: CircularProgressIndicator()));
          } else if (snapshot.hasError) {
            // If there was an error
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text("Null"),
            );
          } else {
            // If the Future has completed successfully
            final data = snapshot.data!.docs; // Access the Map

            final name = data[0].data() as Map<String, dynamic>;
            // Access the specific data you need from the first document
            title1 = name['name'] as String;
            title2 = name['name2'] as String;
            title3 = name['name3'] as String;
            title4 = name['name4'] as String;
            title5 = name['name5'] as String;
            title6 = name['name6'] as String;
            title7 = name['name7'] as String;
            title8 = name['name8'] as String;
            title9 = name['name9'] as String;


            return Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 60, bottom: 30),
                  child: Text(
                    'Category',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 23
                    ),
                  ),
                ),
                Row(

                  children: [
                    // Text("data")

                    category(
                        imagePath: purl2, title: title1),

                    category(
                        imagePath:purl3, title: title2),

                    category(imagePath:purl1,
                        title: title3)


                  ],

                ),
                Row(

                  children: [

                    category(imagePath:purl4,
                        title: title4),

                    category(
                        imagePath: purl5, title: title5),

                    category(imagePath: purl,
                        title: title6)


                  ],

                ),
                Row(

                  children: [

                    category(
                        imagePath: purl7, title: title7),

                    category(
                        imagePath:purl6, title: title8),

                    category(imagePath: purl8,
                        title: title9)


                  ],

                ),
              ],);
          };
        },),

    );
  }


  Future<void> _fetchImageUrl() async {
    try {
      String Url8 = await getImageUrl('Category/beard.png');
      String Url9 = await getImageUrl('Category/straightening.png');
      String Url10 = await getImageUrl('Category/haircut.png');
      String Url11 = await getImageUrl('Category/makeup.png');
      String Url12 = await getImageUrl('Category/mani-pedi.png');
      String Url13 = await getImageUrl('Category/message.png');
      String Url14 = await getImageUrl('Category/waxing.png');
      String Url15 = await getImageUrl('Category/coloring.png');
      String Url16 = await getImageUrl('Category/facial.png');

      setState(() {
        purl=Url8;
        purl1=Url9;
        purl2=Url10;
        purl3=Url11;
        purl4=Url12;
        purl5=Url13;
        purl6=Url14;
        purl7=Url15;
        purl8=Url16;

      });
    } catch (e) {
      print('Error fetching image URL: $e');

    }
  }
}