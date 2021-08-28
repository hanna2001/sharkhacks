import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewReport3 extends StatefulWidget {
  @override
  _NewReport3State createState() => _NewReport3State();
}

class _NewReport3State extends State<NewReport3> {
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
                  padding: EdgeInsets.only(left: 31, top: 45),
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
                  onPressed: () {},
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
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('images/Rectangle 2.png'),
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
                    alignment: Alignment.center,
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
                  Container(
                    margin: EdgeInsets.only(top: 8, right: 23),
                    alignment: Alignment.centerRight,
                    child: FloatingActionButton.extended(
                      onPressed: () {
                        // Add your onPressed code here!
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
