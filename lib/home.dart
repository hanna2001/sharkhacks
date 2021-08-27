import 'package:flutter/material.dart';

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
            top: 100,
            right: 0,
            child: Container(
              color: Colors.amber,
              height: MediaQuery.of(context).size.height/4,
              width: MediaQuery.of(context).size.width/2,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.only(bottomLeft: Radius.circular(100.0)),
              color: Colors.amber,
            ),
            height: 150,
            width: MediaQuery.of(context).size.width,
          ),
          Positioned(
            bottom: 0,
            child: Container(
              color: Colors.blueGrey,
              height: MediaQuery.of(context).size.height/3,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Positioned(
            top: 150,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(70),
                color: Colors.pink,
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
