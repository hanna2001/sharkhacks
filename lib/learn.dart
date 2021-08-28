import 'package:flutter/material.dart';
import 'package:sharkhack/webview_container.dart';

class Learn extends StatefulWidget {
  @override
  _LearnState createState() => _LearnState();
}

class _LearnState extends State<Learn> {
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
              color: Color(0xFFCFA842),
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width / 2,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 50),
            child: Text(
              'Learn More',
              style: TextStyle(color: Colors.white, fontSize: 35),
            ),
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.only(bottomLeft: Radius.circular(50.0)),
              color: Color(0xFFCFA842),
            ),
            height: 150,
            width: MediaQuery.of(context).size.width,
          ),
          Positioned(
            bottom: 0,
            child: Container(
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
              // padding: EdgeInsets.all(30),
              child: Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(70)),
                  child: WebViewContainer(
                      'https://www.the-aquatic-show.biz/qna.html'),
                ),
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
