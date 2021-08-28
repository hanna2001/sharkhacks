import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sharkhack/home.dart';
import 'new_report2.dart';

class SuccessPage extends StatelessWidget {
  Color topColor = Color(0xffCF5EB6);
  String buttonText = 'Navigate to Home';
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
              height: MediaQuery.of(context).size.height/4,
              width: MediaQuery.of(context).size.width/2,
              color: topColor,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius:
              BorderRadius.only(bottomLeft: Radius.circular(56.0)),
              color: topColor,
            ),
            height:150,
            width: MediaQuery.of(context).size.width,
            child: Container(
                  alignment : Alignment.topLeft,
                  padding: EdgeInsets.only(left:13, top:36),
                  child: Text(
                    'Success',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,

                    ),
                  ),
                ),



          ),
          Positioned(
            bottom: 0,
            child: Container(
              child: Container(
                child: Text(
                  'Let\'s do what is right \nFor the Whales we must fight!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,

                  ),
                  textAlign: TextAlign.center,
                ),
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 60),

              ),

              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('images/bottom_img.png'),
                  fit: BoxFit.fill,
                ),
              ),
              height: MediaQuery.of(context).size.height/3,
              width: MediaQuery.of(context).size.width,

            ),
          ),
          Positioned(
            top: 150,
            child: Container(
              child: Column(
                children: [ Container(
                  alignment : Alignment.center,
                  height: MediaQuery.of(context).size.height/3,
                  width:  MediaQuery.of(context).size.height/2.8,

                  margin: EdgeInsets.only(top: 20),
                  child: Icon(Icons.check_outlined,
                    size: 200,
                    color: Colors.white,
                  ),
                          decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(150),
                          color: Color(0xff4DCE41) ,
                       ),
                ),
                  Container(
                    margin: EdgeInsets.only(top: 30, left: 20, right: 20),
                    child: Text(
                      'Your report was successfully registered!! We’ll make sure it gets heard. You can see the progress of the report in view report section of the app!!',
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                  ),
                   Container(
                    child: FloatingActionButton.extended(
                       onPressed: () {
                         Navigator.pushAndRemoveUntil(
                           context,
                           MaterialPageRoute(
                             builder: (BuildContext context) => HomePage(),
                           ),
                               (route) => false,
                         );
                       },
                       shape: RoundedRectangleBorder(
                           side: BorderSide(width: 4.0,
                               color:const Color(0xff3A70A3)),
                           borderRadius: BorderRadius.all(Radius.circular(16.0))),
                       label: Text(buttonText,
                         style: TextStyle( fontSize: 18),),

                       backgroundColor: const Color(0xff3A70A3),
                     ),

                     margin: EdgeInsets.only(right: 30,top: 20),
                     alignment: Alignment.bottomRight,
                   ),
                ],
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(70),
                color: Colors.white,
              ),

              height: MediaQuery.of(context).size.height/1.6,
              width: MediaQuery.of(context).size.width,
            ),
          )
        ],
      ),
    );
  }

}
