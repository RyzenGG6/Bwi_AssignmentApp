import 'package:bwi_intern/Card/category_card.dart';
import 'package:bwi_intern/Firebase/firebase.dart';
import 'package:bwi_intern/pages/page1.dart';
import 'package:bwi_intern/pages/page2.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:firebase_app_check/firebase_app_check.dart';

import '../Card/card.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
   String link1 = "", link2 = "";
  final List<String> item = [
    'Assets/images/profile.jpg'
    'Assets/images/profile.jpg'
    // 'https://cdn.pixabay.com/photo/2015/03/10/17/23/youtube-667451_1280.png',
    // 'https://cdn.pixabay.com/photo/2015/03/10/17/23/youtube-667451_1280.png',
        // 'https://example.com/image3.jpg',
    // Add more image URLs as needed
  ];

  final List<String> textList = [
    'Description 1',
    'Description 2',
    // 'Description 3',
    // Add more descriptions as needed
  ];
  // link2 = "";
  @override
  void initState() {
    // TODO: implement initState
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
    double screenWidth = MediaQuery.of(context).size.width;
    PageController pageController = PageController();

    return Scaffold(
      body: SingleChildScrollView(
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('banner').snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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

              final url = data[0].data() as Map<String, dynamic>;
              // Access the specific data you need from the first document
              link1 = url['url'] as String;
              // link2 = url['movie2'] as String;

              return Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 20, top: 40, right: 20),
                        height: 90,
                        child: CircleAvatar(
                          radius: 25,
                          child: ClipOval(
                            child: Image.asset(
                              'Assets/images/profile.jpg',
                              fit: BoxFit.fitHeight, // Adjust the fit as needed
                              width: 100,
                              height: 100,
                            ),
                          ),

                          // backgroundImage: AssetImage(
                          //     'Assets/images/profile.jpg'),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 35),
                        child: RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Good Morning\n',
                                  style: TextStyle(
                                      color: Colors.grey.shade700, fontSize: 15)),
                              TextSpan(
                                  text: 'Sushma Shukla',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 20)),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 80, top: 40, bottom: 20),
                        child: IconButton(
                          onPressed: () {
                            // print(link1);
                            print(link2);
                          },
                          icon: Icon(
                            Icons.notifications_none_outlined,
                            color: Colors.grey.shade900,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 0, top: 40, bottom: 20),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.bookmark_add_outlined,
                            color: Colors.grey.shade900,
                          ),
                        ),
                      ),
                      // Container(
                      //   padding: EdgeInsets.only(left:0,top: 40),
                      //   child: IconButton(onPressed: (){
                      //
                      //   }, icon: Icon(Icons.bookmark_add_outlined,color: Colors.grey.shade800,),),
                      // ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10,top: 10),
                    margin: EdgeInsets.only(top: 20),
                    width: screenWidth - 20,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: ClipOval(
                      child: TextField(
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(8),
                            hintText: 'Search',
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.search),
                            suffixIcon: Image.asset(
                              'Assets/images/filter icon.png',
                              scale: 20,
                            )),
                      ),
                    ),
                  ),
//
// PageView(
//   controller: pageController,
//   scrollDirection: Axis.horizontal,
//   onPageChanged: (num){
//     setState(() {
//       currentIndex=num;
//     });
//   },
//   children: [
// page1(),
//   ],
// ),
//
//           SmoothPageIndicator(
//             controller: pageController,
//             count: 3,
//             effect: WormEffect(activeDotColor: Colors.blue, dotColor: Colors.grey),
//           ),

                  SizedBox(
                    height: 300,
                    child: PageView(
                        controller: pageController,
                        children: [page1(context), page2()]),
                  ),
                  Container(
                    child: SmoothPageIndicator(
                      controller: pageController,
                      count: 4,
                      effect: WormEffect(
                        radius: 4,
                        // offset: 20,
                        spacing: 8.0,
                        dotWidth: 20.0,
                        dotHeight: 10.0,
                      ),
                    ),
                  ),
                  // PageView
// SizedBox

           Row(
             children: [
               Container(
                 padding: EdgeInsets.only(left: 20,top: 40),
                 child: Text(
                   'Featured Services',style: TextStyle(
                   fontWeight: FontWeight.w600,
                   fontSize: 17
                 ),
                 ),
               )
             ],
           ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: AlwaysScrollableScrollPhysics(),
                    child:  Row(
                      children: [
                        // Example Card 1
                        MyCard(
                          imagePath: 'Assets/images/profile.jpg',
                          title: 'Beard Trimming',
                        ),

                        // Add more cards as needed
                        MyCard(
                          imagePath: 'Assets/images/img.png',
                          title: 'Another Service',
                        ),
                        MyCard(
                          imagePath: 'Assets/images/profile.jpg',
                          title: 'Another Service',
                        ),

                        // Add more cards as needed
                        // ...

                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Container(
                        padding: EdgeInsets.only(left: 20,top: 40),
                        child: Text(
                          'Category',style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 17
                        ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: screenWidth-180,top: 40),
                        child: Text(
                          'View All',style: TextStyle(
                          color: Colors.lightBlue.shade900,
                            fontWeight: FontWeight.w600,
                            fontSize: 17
                        ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
Container(
  width: screenWidth,
  child:   Row(

    children: [

  category(imagePath: "Assets/images/haircut.png", title: "Hair Cut"),

  category(imagePath: "Assets/images/makeup.png", title: "Hair Cut"),

  category(imagePath: "Assets/images/straightening.png", title: "Hair Cut")





    ],

  ),

),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: screenWidth,
                    child:   Row(

                      children: [

                        category(imagePath: "Assets/images/haircut.png", title: "Hair Cut"),

                        category(imagePath: "Assets/images/makeup.png", title: "Hair Cut"),

                        category(imagePath: "Assets/images/straightening.png", title: "Hair Cut")





                      ],

                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Container page1(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: 300,
      width: screenWidth - 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child:Image.network(link1),
        // fit: BoxFit.cover, // You might want to adjust the fit based on your requirements

    );
  }

  Future<void> fetchData() async {
    print("hello");
    try {
      final ref = FirebaseStorage.instance.ref().child('testimage');
// no need of the file extension, the name will do fine.
      var url = await ref.getDownloadURL();
      print("url is : "+url);

      setState(() {
        link2 = url;
      });
    } catch (error) {
      print('Error: $error');
    }
  }

// page1() {}
}
