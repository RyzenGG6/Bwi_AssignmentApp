import 'package:flutter/material.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Container(
              // padding: EdgeInsets.only(left: 10),
              margin: EdgeInsets.only(left: 300, top: 50),
              child: Text(
                'SKIP',
                style: TextStyle(color: Colors.pink),
              )),
          Container(
              // padding: EdgeInsets.all(10),
              child: Center(
            child: Image.asset(
              'Assets/images/img.png',
              fit: BoxFit.contain,
            ),
          )),
          Center(
            child: Container(
              height: 389,
              width: screenWidth,
              color: Colors.white,
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 40),
              margin: EdgeInsets.only(top: screenHeight - 880),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      25.0), // Adjust the radius as needed
                ),
                elevation: 5.0,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 80),
                      child:
                      Column(
                        children: [
                          TextField(
                            style: TextStyle(color: Colors.grey),
                            decoration: InputDecoration(
                                suffixIcon: Icon(
                                  Icons.call,
                                  color: Colors.grey,
                                ),
                                hintText: 'Enter Mobile Number',
                                hintStyle: TextStyle(color: Colors.grey)),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 60),
                            width: 280,
                            height: 110,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xFF0E516C), // Button background color
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      10.0), // BorderRadius for rounded corners
                                ),
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context, 'otp');
                              },
                              child: Text(
                                'CONTINUE',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(20),
                            child: RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'By continuing you are agree to our \n',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                  TextSpan(
                                      text: 'Terms & Conditions ',
                                      style: TextStyle(color: Colors.blueAccent)),
                                  TextSpan(
                                    text: 'and ',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                  TextSpan(
                                      text: ' Privacy Policy',
                                      style: TextStyle(color: Colors.blueAccent)),
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ),


                    //                 Text('By continuing you are agree to our'),
                    // Text(Terms & Conditions )and Privacy Policy
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
