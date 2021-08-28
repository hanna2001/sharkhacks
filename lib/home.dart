import 'package:flutter/material.dart';
import 'package:sharkhack/educate.dart';
import 'package:sharkhack/learn.dart';
import 'package:sharkhack/new_report.dart';
import 'package:sharkhack/view_status.dart';

class HomePage extends StatelessWidget {
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
            top: 200,
            right: 0,
            child: Container(
              color: Color(0xFF3A70A3),
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width / 1.6,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Saverine',
                  style: TextStyle(color: Colors.white, fontSize: 50),
                ),
                Text('save marine life,\none step at a time',
                    style: TextStyle(color: Colors.white, fontSize: 18))
              ],
            ),
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.only(bottomLeft: Radius.circular(100.0)),
              color: Color(0xFF3A70A3),
            ),
            height: 240,
            width: MediaQuery.of(context).size.width,
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: EdgeInsets.all(20),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  height: 60,
                  minWidth: 120,
                  color: Color(0xFF3A70A3),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Educate()));
                  },
                  child: Text(
                    'educate yourself',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
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
            top: 240,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 60, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NewReportPage(),
                            ),
                          );
                        },
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add,
                                size: 50,
                                color: Color(0xFFEBEBEB),
                              ),
                              Text(
                                'raise new \n   report',
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                          height: MediaQuery.of(context).size.height / 6,
                          width: MediaQuery.of(context).size.height / 8,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('images/home2.png'),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ViewStatus(),
                            ),
                          );
                        },
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.list,
                                size: 50,
                                color: Color(0xFFEBEBEB),
                              ),
                              Text(
                                'view reports \n      status',
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                          height: MediaQuery.of(context).size.height / 6,
                          width: MediaQuery.of(context).size.height / 8,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('images/home1.png'),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'not sure about what to report \nand what to not? ',
                        style: TextStyle(fontSize: 18),
                      ),
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        height: 60,
                        minWidth: 120,
                        color: Color(0xFF130F27),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Learn()));
                        },
                        child: Text(
                          'learn here',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  )
                ],
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(70),
                color: Colors.white,
              ),
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
            ),
          )
        ],
      ),
    );
  }
}
