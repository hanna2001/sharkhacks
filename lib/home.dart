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
              height: 100,
              width: 100,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.only(bottomLeft: Radius.circular(100.0)),
              color: Colors.amber,
            ),
            height: 150,
            width: double.infinity,
          ),
          Positioned(
            bottom: 0,
            child: Container(
              color: Colors.blueGrey,
              height: 233,
              width: double.infinity,
            ),
          ),
          Positioned(
            top: 150,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(70),
                color: Colors.white,
              ),
              height: 456,
              width: double.infinity,
            ),
          )
        ],
      ),
    );
  }
}
