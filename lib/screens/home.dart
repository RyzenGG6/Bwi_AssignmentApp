import 'package:bwi_intern/pages/page1.dart';
import 'package:bwi_intern/pages/page2.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class home extends StatefulWidget {
  const home({super.key});
  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    String link1 = "", link2 = "";

    final items = [
      Image.asset('Assets/images/profile.jpg'),
      Image.asset('Assets/images/img.png')
    ];
    int currentIndex = 0;
    double screenWidth = MediaQuery.of(context).size.width;
    PageController pageController = PageController();

    return Scaffold(
      body:

      StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('url').snapshots(),
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
                        TextSpan(text: 'Good Morning\n', style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 15
                        )),
                        TextSpan(text: 'Sushma Shukla', style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black,
                            fontSize: 20
                        )),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 80, top: 40, bottom: 20),
                  child: IconButton(onPressed: () {

                  }, icon: Icon(Icons.notifications_none_outlined, color: Colors
                      .grey.shade900,),),
                ),
                Container(
                  padding: EdgeInsets.only(left: 0, top: 40, bottom: 20),
                  child: IconButton(onPressed: () {

                  }, icon: Icon(Icons.bookmark_add_outlined, color: Colors.grey
                      .shade900,),),
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
              padding: EdgeInsets.only(left: 10),
              margin: EdgeInsets.only(top: 10),
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
                      suffixIcon: Image.asset('Assets/images/filter icon.png',
                        scale: 20,)
                  ),
                ),),),
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
                  controller:
                  pageController,
                  children: const [ page1(), page2()]
              ),

            ),
            Container(
              child: SmoothPageIndicator(controller: pageController,
                count: 4,
                effect: WormEffect(
                  radius: 4,
                  // offset: 20,
                  spacing: 8.0,
                  dotWidth: 20.0,
                  dotHeight: 10.0,
                ),
              ),
            )
            // PageView
// SizedBox

          ],
        );
      }

    },), );
  }
}
