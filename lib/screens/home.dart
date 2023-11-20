import 'package:bwi_intern/Card/category_card.dart';
import 'package:bwi_intern/Card/service.dart';
import 'package:bwi_intern/Firebase/firebase.dart';
import 'package:bwi_intern/pages/page1.dart';
import 'package:bwi_intern/pages/page2.dart';
import 'package:bwi_intern/screens/Category.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:polar_tab_bar/models/polar_tab_item.dart';
import 'package:polar_tab_bar/polar_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:polar_tab_bar/widgets/polar_tab_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Card/card.dart';

class home extends StatefulWidget {
  const home({super.key});
  @override
  State<home> createState() => _homeState();
}
String url='',url1='',surl='',surl2='',surl3='';
String link='';
String name='',name1='',name2='';
String price='',price1='',price2='';
String curl='';
String curl2='',curl3='',title='',title1='',title2='',title3='',title4='',title5='';
String purl='',purl1='',purl2='',purl3='',purl4='',purl5='';
class _homeState extends State<home> {




  final List<PolarTabItem> tabs = [
    PolarTabItem(
      index: 0,
      title: "All",
      page: PolarTabPage(
        child: SingleChildScrollView(
          child: Column(
            children: [
              service(
                  imagePath:link,
                  title: "Tanishk Unisex Salon"),
              service(
                  imagePath: curl2,
                  title: "Tanishk Unisex Salon"),
            ],
          ),
        ),
      ),
    ),
    PolarTabItem(
      index: 1,
      title: "Haircuts",
      page: PolarTabPage(
        child: service(
            imagePath: curl2,
            title: "Tanishk Unisex Salon",
            distance: 1.2,
            description: 'janakpuri, New Delhi',
            rating: 4.8,
            reviews: 256),
      ),
    ),
    PolarTabItem(
      index: 2,
      title: "Make up",
      page: PolarTabPage(
        child: service(
          imagePath: curl3,
          title: "Tanishk Unisex Salon",
          distance: 1.2,
          description: 'janakpuri, New Delhi',
          rating: 4.8,
          reviews: 256,
        ),
      ),
    ),
    PolarTabItem(
      index: 3,
      title: "Manicure",
      page: PolarTabPage(
        child: service(
            imagePath: "Assets/images/img.png",
            title: "Tanishk Unisex Salon",
            distance: 1.2,
            description: 'janakpuri, New Delhi',
            rating: 4.8,
            reviews: 256),
      ),
    ),
  ];
  String link1 = "", link2 = "";
  int _selectedIndex = 0;
  final List<String> item = [
    'Assets/images/profile.jpg'
        'Assets/images/profile.jpg'
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
   _fetchImageUrl();
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
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // While the Future is still loading
              return Center(
                  child: CircularProgressIndicator());
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

              final url = data[1].data() as Map<String, dynamic>;
              // Access the specific data you need from the first document
              link1 = url['url'] as String;
              link = url['url1'] as String;
              name = url['name'] as String;
              name1 = url['name1'] as String;
              name2 = url['name2'] as String;
              price = url['price'] as String;
              price1 = url['price1'] as String;
              price2 = url['price2'] as String;
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
                                      color: Colors.grey.shade700,
                                      fontSize: 15)),
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
                            print(curl);
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
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, top: 10),
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

                SizedBox(
                height: 250,
                width: screenWidth - 40,
                child: Container(
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                ),
                child: PageView(
                controller: pageController,
                children: [page1(context), page2()],
                ),
                ),
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


                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 20, top: 40),
                        child: Text(
                          'Featured Services',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600, fontSize: 17
                          ),
                        ),
                      )
                    ],
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: AlwaysScrollableScrollPhysics(),
                    child: Row(
                      children: [
                        MyCard(
                          imagePath:surl,
                          title: name,
                          price: price,
                        ),


                        MyCard(
                          imagePath:surl3,
                          title: name1,
                          price: price1,
                        ),
                        MyCard(
                          imagePath: surl2,
                          title: name2,
                          price: price2,
                        ),


                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 20, top: 40),
                        child: Text(
                          'Category',
                          style:GoogleFonts.poppins(
                              fontWeight: FontWeight.w600, fontSize: 17
                          ),

                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.only(left: screenWidth - 180, top: 40),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, 'category');
                          },
                          child: Text(
                            'View All',
                            style: TextStyle(
                                color: Colors.lightBlue.shade900,
                                fontWeight: FontWeight.w600,
                                fontSize: 17),
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
                    // child:row();
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: screenWidth,
                    child:row(),
                  ),

                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 30, top: 40),
                        child: Text(
                          'Most Popular Services',
                          style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600, fontSize: 17
                )

                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 350,
                    child: Container(
                      // width: 40,
                      padding: EdgeInsets.only(left: 40, top: 20),
                      child: PolarTabBar(
                        // background: Colors.lightBlue.shade100,
                          swipeable: true,
                          activeTitleStyle: TextStyle(
                            color: Colors.white
                          ),
                          activeBackground:Color(0xFF023e8a),
                          type: PolarTabType.pill, // Default Type
                          tabs: tabs),
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
      height: 200,
      width: screenWidth - 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Image.network(
        url,
        height: 200,
        width: screenWidth - 20,
        fit: BoxFit.contain,
      ),
    );

  }

  Future<void> fetchData() async {
    print("hello");
    try {
      final ref = FirebaseStorage.instance.ref().child('testimage');
// no need of the file extension, the name will do fine.
      var url = await ref.getDownloadURL();
      print("url is : " + url);

      setState(() {
        link2 = url;
      });
    } catch (error) {
      print('Error: $error');
    }
  }
  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return home();
      case 1:
        return category_page();
      default:
        return Container();
    }
  }

  Future<void> _fetchImageUrl() async {
    try {
      String Url = await getImageUrl('banner.png');
      String Url1 = await getImageUrl('banner2.png');
      String Url2 = await getImageUrl('Featured Services/beard.jpg');
      String Url3 = await getImageUrl('Featured Services/hair colouring.jpg');
      String Url4 = await getImageUrl('Featured Services/hair straightening.png');
      String Url5 = await getImageUrl('Most Popular Services/saloon.jpg');
      String Url6 = await getImageUrl('Most Popular Services/saloon2.jpg');
      String Url7 = await getImageUrl('Most Popular Services/saloon3.jpg');
      String Url8 = await getImageUrl('Category/beard.png');
      String Url9 = await getImageUrl('Category/straightening.png');
      String Url10 = await getImageUrl('Category/haircut.png');
      String Url11 = await getImageUrl('Category/makeup.png');
      String Url12 = await getImageUrl('Category/mani-pedi.png');
      String Url13 = await getImageUrl('Category/message.png');
      // String purl = await getImageUrl('Category/straightening.png');

      setState(() {
        url = Url;
        url1=Url1;
        surl=Url2;
        surl2=Url3;
        surl3=Url4;
        curl=Url5;
        curl2=Url6;
        curl3=Url7;
        purl=Url8;
        purl1=Url9;
        purl2=Url10;
        purl3=Url11;
        purl4=Url12;
        purl5=Url13;

      });
    } catch (e) {
      print('Error fetching image URL: $e');
      // Handle the error as needed
    }
  }
  Widget row() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('banner').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Container(
              padding: EdgeInsets.all(30),
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else if (snapshot.data!.docs.isEmpty) {
          return Center(
            child: Text("Null"),
          );
        } else {
          final data = snapshot.data!.docs;
          final name = data[0].data() as Map<String, dynamic>;

          title = name['name'] as String;
          title1 = name['name2'] as String;
          title2 = name['name3'] as String;
          title3 = name['name4'] as String;
          title4 = name['name5'] as String;
          title5 = name['name6'] as String;

          return Column(
            children: [
              Row(
                children: [
                  category(imagePath: purl2, title: title),
                  category(imagePath: purl3, title: title1),
                  category(
                      imagePath: purl1, title: title2),
                ],
              ),     Row(
                children: [
                  category(imagePath: purl4, title: title3),
                  category(imagePath: purl5, title: title4),
                  category(
                      imagePath: purl, title: title5),
                ],
              ),
              // Add more widgets as needed
            ],
          );
        }
      },
    );
  }

// page1() {}
}
