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

import '../Card/card.dart';

class home extends StatefulWidget {
  const home({super.key});
  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  String url='',surl='',surl2='',surl3='';
  final List<PolarTabItem> tabs = [
    PolarTabItem(
      index: 0,
      title: "All",
      page: PolarTabPage(
        child: SingleChildScrollView(
          child: Column(
            children: [
              service(
                  imagePath: "Assets/images/img.png",
                  title: "Tanishk Unisex Salon"),
              service(
                  imagePath: "Assets/images/filter icon.png",
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
            imagePath: "Assets/images/img.png",
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
          imagePath: "Assets/images/img.png",
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

              final url = data[1].data() as Map<String, dynamic>;
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
// SizedBox

                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 20, top: 40),
                        child: Text(
                          'Featured Services',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 17),
                        ),
                      )
                    ],
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: AlwaysScrollableScrollPhysics(),
                    child: Row(
                      children: [
                        // Example Card 1
                        MyCard(
                          imagePath:surl,
                          title: 'Beard Trimming',
                        ),

                        // Add more cards as needed
                        MyCard(
                          imagePath:surl3,
                          title: 'Another Service',
                        ),
                        MyCard(
                          imagePath: surl2,
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
                        padding: EdgeInsets.only(left: 20, top: 40),
                        child: Text(
                          'Category',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 17),
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
                    child: Row(
                      children: [
                        category(
                            imagePath: "Assets/images/haircut.png",
                            title: "Hair Cut"),
                        category(
                            imagePath: "Assets/images/makeup.png",
                            title: "Hair Cut"),
                        category(
                            imagePath: "Assets/images/straightening.png",
                            title: "Hair Cut")
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 40, top: 20),
                        child: Text(
                          'Most Popular Services',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 17),
                        ),
                      ),
                    ],
                  ),
                  //             Container(
                  //               height: 50,
                  //               child: DefaultTabController(
                  //               length: 3,
                  //               child: Column(
                  //               children: [
                  //               Material(
                  //               child: Container(
                  //               height: 55,
                  //               // width: 10,
                  //               color: Colors.white,
                  //               child: TabBar(
                  //               physics: const ClampingScrollPhysics(),
                  //               padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
                  //               unselectedLabelColor: Colors.pink,
                  //               indicatorSize: TabBarIndicatorSize.label,
                  //               indicator: BoxDecoration(
                  //               borderRadius: BorderRadius.circular(30),
                  //               color: Colors.green.shade700
                  // ),
                  // tabs: [
                  // Tab(
                  // child: Container(
                  // height: 50,
                  // decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(30),
                  // border: Border.all(color: Colors.pinkAccent, width: 1)
                  // ),
                  // child: Align(
                  // alignment: Alignment.center,
                  // child: Text("All"),
                  // ),
                  // ),
                  // ),
                  // Tab(
                  // child: Container(
                  // height: 50,
                  // decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(30),
                  // border: Border.all(color: Colors.pinkAccent, width: 1)
                  // ),
                  // child: Align(
                  // alignment: Alignment.center,
                  // child: Text("Haircuts"),
                  // ),
                  // ),
                  // ),
                  // Tab(
                  // child: Container(
                  // height: 50,
                  // decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(30),
                  // border: Border.all(color: Colors.pinkAccent, width: 1)
                  // ),
                  // child: Align(
                  // alignment: Alignment.center,
                  // child: Text("Make up"),
                  // ),
                  // ),
                  // ),
                  //   Tab(
                  //     child: Container(
                  //       height: 40,
                  //       width: 70,
                  //       decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(20),
                  //           border: Border.all(color: Colors.pinkAccent, width: 1)
                  //       ),
                  //       child: Align(
                  //         alignment: Alignment.center,
                  //         child: Text("Manicure"),
                  //       ),
                  //     ),
                  //   )
                  // ],
                  // ),
                  // ),
                  // ),
                  // SizedBox(
                  //   height: 300,
                  // ),
                  // Expanded(
                  // child: TabBarView(
                  // children: [
                  //   ListView.separated(
                  //     padding: EdgeInsets.all(15),
                  //     itemCount: 20,
                  //     separatorBuilder: (BuildContext context, int index) => const Divider(),
                  //     itemBuilder: (context, index){
                  //       return ListTile(
                  //         onTap: () {},
                  //         title: Text("Chat List $index"),
                  //         subtitle: Text("Tab bar ui"),
                  //         trailing: Icon(Icons.arrow_circle_right_sharp),
                  //       );
                  //     },
                  //   ),
                  //   ListView.separated(
                  //     padding: EdgeInsets.all(15),
                  //     itemCount: 20,
                  //     separatorBuilder: (BuildContext context, int index) => const Divider(),
                  //     itemBuilder: (context, index){
                  //       return ListTile(
                  //         onTap: () {},
                  //         title: Text("Status List $index"),
                  //         subtitle: Text("Tab bar ui"),
                  //         trailing: Icon(Icons.arrow_circle_right_sharp),
                  //       );
                  //     },
                  //   ),
                  //   ListView.separated(
                  //     padding: EdgeInsets.all(15),
                  //     itemCount: 20,
                  //     separatorBuilder: (BuildContext context, int index) => const Divider(),
                  //     itemBuilder: (context, index){
                  //       return ListTile(
                  //         onTap: () {},
                  //         title: Text("Call List $index"),
                  //         subtitle: Text("Tab bar ui"),
                  //         trailing: Icon(Icons.arrow_circle_right_sharp),
                  //       );
                  //     },
                  //   ),
                  // ],
                  // ),
                  // )
                  //     ],
                  //   ),),
                  //             ),

                  // Text("bkfnakjd\nanfkddfksdnfsdjksf\ndfjsdbsf\n\nfsdffs\sdfsdfsd\nsdfdsfds")
                  Container(
                    height: 350,
                    child: Container(
                      // width: 40,
                      padding: EdgeInsets.only(left: 40, top: 20),
                      child: PolarTabBar(
                          swipeable: true,
                          activeBackground: Colors.blueAccent.shade700,
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
      String Url2 = await getImageUrl('Featured Services/beard.jpg');
      String Url3 = await getImageUrl('Featured Services/hair colouring.jpg');
      String Url4 = await getImageUrl('Featured Services/hair straightening.png');
      setState(() {
        url = Url;
        surl=Url2;
        surl2=Url3;
        surl3=Url4;
      });
    } catch (e) {
      print('Error fetching image URL: $e');
      // Handle the error as needed
    }
  }

// page1() {}
}
