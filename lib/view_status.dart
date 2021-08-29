import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sharkhack/view_status2.dart';

class ViewStatus extends StatefulWidget {
  @override
  _ViewStatusState createState() => _ViewStatusState();
}

String mobile;

class _ViewStatusState extends State<ViewStatus> {
  String err = "";
  final mobcont = TextEditingController();
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
              color: Color(0xFFA94646),
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width / 2,
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 40, right: 40, top: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'View Status',
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Step 1/2',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )
              ],
            ),
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.only(bottomLeft: Radius.circular(50.0)),
              color: Color(0xFFA94646),
            ),
            height: 150,
            width: MediaQuery.of(context).size.width,
          ),
          Positioned(
            top: 150,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Enter mobile number',
                      style: TextStyle(color: Color(0xFF130F27), fontSize: 20),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: TextField(
                      controller: mobcont,
                      style: TextStyle(color: Colors.white),
                      showCursor: false,
                      cursorHeight: 30,
                      decoration: InputDecoration(
                        hintText: 'type here',
                        hintStyle: TextStyle(color: Colors.white),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                        disabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                      ),
                    ),
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
                  Text(err),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Material(
                      color: Color(0xFF3A70A3),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: MaterialButton(
                        onPressed: () {
                          FirebaseFirestore.instance
                              .collection("users")
                              .doc(mobcont.text)
                              .get()
                              .then((value) => {
                                    if (value.exists)
                                      {
                                        setState(() {
                                          rep = List.from(
                                              value.data()['reports']);
                                          a = value.data()['inprogress'];
                                          b = value.data()['resolved'];

                                          // dataMap['in progress'] = double.parse(
                                          //     value.data()[
                                          //         'count["in progress"]']);
                                          // dataMap['resolved'] = double.parse(
                                          //     value
                                          //         .data()['count["resolved"]']);
                                        }),
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ViewStatus2()))
                                      }
                                    else
                                      {
                                        setState(() {
                                          err = "record doesnt exist!!";
                                        })
                                      }
                                  });
                        },
                        child: Text(
                          'view',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(70),
                color: Colors.white,
              ),
              height: MediaQuery.of(context).size.height / 1.6,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('images/Rectangle 2.png'),
                ),
              ),
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width,
            ),
          ),
        ],
      ),
    );
  }
}
