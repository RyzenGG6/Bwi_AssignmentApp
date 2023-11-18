import 'dart:async';

import 'package:bwi_intern/screens/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:otp_pin_field/otp_pin_field.dart';

String verify='';
String label='';
bool val=false;
Future<bool> validateOTP(String phoneNumber, String otp) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  try {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
        print("success");
        val = true;
      },
      verificationFailed: (FirebaseAuthException e) {
        print("verification error");
      },
      codeSent: (String verificationId, int? resendToken) async {
        print("code sent");
        verify=verificationId;
        val=true;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        
      },
    );
    return val;
  } catch (error) {
    print("error $error");
    return false;
  }
}

class otp extends StatefulWidget {
 final String phone_Number;

   otp({Key? key, required this.phone_Number}) : super(key: key);

  @override
  State<otp> createState() => _otpState();
}

class _otpState extends State<otp> {
  String Otp='';
  bool _isButtonDisabled = false;
  final _otpPinFieldController = GlobalKey<OtpPinFieldState>();
  int _timerSeconds = 60;
@override
  void initState() {
    // TODO: implement initState
  _startTimer();
    super.initState();
  }
  void _startTimer() {
    _isButtonDisabled = true;
    _otpPinFieldController.currentState?.clearOtp();
    setState(() {
      label='CONTINUE';

    });
    const oneSec = const Duration(seconds: 1);
    Timer.periodic(oneSec, (Timer timer) {
      if (_timerSeconds == 0) {
        setState(() {
          _isButtonDisabled = false;
          _timerSeconds=60;
          setState(() {
            label='RESEND CODE';
          });
          timer.cancel();
        });
      } else {
        setState(() {
          _timerSeconds--;
        });
      }
    });

  }
  final FirebaseAuth auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    print("started");
    if(widget.phone_Number.isEmpty){
      print("empty number");
    }
    else {
      print(widget.phone_Number);
    }

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
                      margin: EdgeInsets.only(left: 10, top: 80),
                      child: OtpPinField(
                        key: _otpPinFieldController,
                          otpPinFieldStyle: OtpPinFieldStyle(
                            activeFieldBackgroundColor: Colors.grey,
                          ),
                          maxLength: 6,
                          onSubmit: (text) {
                            setState(() {
                              Otp=text;
                            });

                          },
                          onChange: (text) {
                            Otp=text;
                          }),
                    ),
                    Container(
                        padding: EdgeInsets.only(top: 20),
                        child:
                        Text(
                          _isButtonDisabled
                              ? 'Resend code in $_timerSeconds seconds'
                              : '',
                          style: TextStyle(color: Colors.red),
                        ),
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 20),
                              width: 280,
                              height: 68,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xFF0E516C),
                                  // Button background color
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        10.0), // BorderRadius for rounded corners
                                  ),
                                ),
                                onPressed: () async {
    if(label=='CONTINUE'){
    bool val= await validateOTP(widget.phone_Number, Otp);
    if (val == true) {
    try {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(

    verificationId: verify, smsCode: Otp);

    // Sign the user in (or link) with the credential
    await auth.signInWithCredential(credential);

    Navigator.pushNamed(context, 'home');
    print("success");
    } catch (error) {
    print("Error during sign in: $error");
    }
    }

    }
    else
    {
      _startTimer();

    bool val= await validateOTP(widget.phone_Number, Otp);

    }


    },
    child: Text(
      label,
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
                                      text:
                                          'By continuing you are agree to our \n',
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                    TextSpan(
                                        text: 'Terms & Conditions ',
                                        style: TextStyle(
                                            color: Colors.blueAccent)),
                                    TextSpan(
                                      text: 'and ',
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                    TextSpan(
                                        text: ' Privacy Policy',
                                        style: TextStyle(
                                            color: Colors.blueAccent)),
                                  ],
                                ),
                              ),
                            )
                          ],
                        )),

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
