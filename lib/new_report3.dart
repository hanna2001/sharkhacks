import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sharkhack/new_report.dart';
import 'package:sharkhack/new_report2.dart';
import 'success_page.dart';
import 'package:twilio_flutter/twilio_flutter.dart';
import 'dart:math';
import 'package:http/http.dart';

class NewReport3 extends StatefulWidget {
  @override
  _NewReport3State createState() => _NewReport3State();
}

String err = "";
String mob;
Map<dynamic, dynamic> lol;
String otpsent = "";
String otpget = "x", otpput = "y";
final titlecontroller = TextEditingController();
final descontroller = TextEditingController();
final zipcontroller = TextEditingController();
final addresscontroller = TextEditingController();
final mobcontroller = TextEditingController();
final otpcontroller = TextEditingController();

class _NewReport3State extends State<NewReport3> {
  TwilioFlutter twilioFlutter;

  @override
  void initState() {
    twilioFlutter = twilioFlutter = TwilioFlutter(
        accountSid: 'hehe',
        authToken: 'hehe',
        twilioNumber: 'lol');

    super.initState();
  }

  int inprog = 0, res = 0;
  Color topColor = Color(0xff7355A4);
  String stage = '3';
  String buttonText = 'Submit';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          Positioned(
            top: 100,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width / 2,
              color: topColor,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.only(bottomLeft: Radius.circular(56.0)),
              color: topColor,
            ),
            height: 150,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(left: 13, top: 36),
                  child: Text(
                    'New Report',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  padding: EdgeInsets.only(left: 31, top: 20),
                  child: Text(
                    'Steps ' + stage + '/3',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              child: Container(
                child: FloatingActionButton.extended(
                  onPressed: () async {
                    if (otpsent == otpcontroller.text) {
                      await FirebaseFirestore.instance
                          .collection("users")
                          .doc(mobcontroller.text)
                          .get()
                          .then((value) => {
                                if (value.exists)
                                  {
                                    lol = {
                                      'country': countryname,
                                      'desc': descontroller.text,
                                      'isresolved': false,
                                      'title': titlecontroller.text,
                                      'zipcode': zipcontroller.text,
                                      'address': addresscontroller.text
                                    },
                                    inprog = value.data()['inprogress']++,
                                    res = value.data()['resolved']++,
                                    FirebaseFirestore.instance
                                        .collection("users")
                                        .doc(mobcontroller.text)
                                        .update({
                                      'inprogress': FieldValue.increment(1),
                                      'reports': FieldValue.arrayUnion([lol])
                                    }).then((value) => {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          SuccessPage()))
                                            })
                                  }
                                else
                                  {
                                    lol = {
                                      'country': countryname,
                                      'desc': descontroller.text,
                                      'isresolved': false,
                                      'title': titlecontroller.text,
                                      'zipcode': zipcontroller.text,
                                      'address': addresscontroller.text
                                    },
                                    FirebaseFirestore.instance
                                        .collection("users")
                                        .doc(mobcontroller.text)
                                        .set({
                                      'inprogress': 1,
                                      'resolved': 0,
                                      'reports': [lol]
                                    }).then((value) => {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          SuccessPage()))
                                            })
                                  }
                              });
                    } else {
                      setState(() {
                        err = "wrong otp";
                      });
                    }
                    //   }
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => SuccessPage()));
                  },
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          width: 4.0, color: const Color(0xff3A70A3)),
                      borderRadius: BorderRadius.all(Radius.circular(16.0))),
                  label: Text(
                    buttonText,
                    style: TextStyle(fontSize: 18),
                  ),
                  backgroundColor: const Color(0xff3A70A3),
                ),
                alignment: Alignment.bottomRight,
                margin: EdgeInsets.only(bottom: 43, right: 35),
              ),
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('images/bottom_img.png'),
                  fit: BoxFit.fill,
                ),
              ),
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Positioned(
            top: 150,
            child: Container(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(left: 31, top: 40, bottom: 10),
                    child: Text(
                      'Enter Mobile Number',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Container(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                      controller: mobcontroller,
                      decoration: InputDecoration(
                        hintText: 'Type here...',
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                        disabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                    height: 75,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 20, top: 10),
                    margin: EdgeInsets.only(left: 31, right: 23),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          "images/textbg.png",
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8, right: 23),
                    alignment: Alignment.centerRight,
                    child: FloatingActionButton.extended(
                      onPressed: () async {
                        // print(phonecode + mob);
                        // String otpput =
                        //     ;
                        String otp =
                            (1000 + Random().nextInt(9999 - 1000)).toString();
                        await twilioFlutter
                            .sendSMS(
                                toNumber: '+$phonecode${mobcontroller.text}',
                                messageBody: 'your otp is $otp')
                            .then((value) {
                          setState(() {
                            otpsent = otp;
                          });
                        });
                        print(otp);
                        // print('+$phonecode${mobcontroller.text}');

                        // print(titlecontroller.text);
                        // print(descontroller.text);
                        // print(zipcontroller.text);
                        // print(addresscontroller.text);
                        // print(mobcontroller.text);

                        // then((value) => {
                        //       setState(() {
                        //         otpsent = "OTP sent successfully!";
                        //       })
                        //     });
                      },
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              width: 4.0, color: const Color(0xff3A70A3)),
                          borderRadius:
                              BorderRadius.all(Radius.circular(16.0))),
                      label: Text(
                        'Get OTP',
                        style: TextStyle(fontSize: 18),
                      ),
                      backgroundColor: const Color(0xff3A70A3),
                    ),
                  ),
                  // Text("$otpsent"),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(
                        left: 31, top: 40, bottom: 10, right: 31),
                    child: Text(
                      'An OTP would be sent to your number to verify as a human and then your report will be processed!!',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Container(
                    child: TextField(
                      controller: otpcontroller,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                      decoration: InputDecoration(
                        hintText: 'Enter OTP',
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                        disabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                    height: 75,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 20),
                    margin: EdgeInsets.only(left: 31, right: 23),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          "images/textbg.png",
                        ),
                      ),
                    ),
                  ),
                  Text(err)
                ],
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(70),
                color: Colors.white,
              ),
              height: MediaQuery.of(context).size.height / 1.6,
              width: MediaQuery.of(context).size.width,
            ),
          )
        ],
      ),
    );
  }
}
