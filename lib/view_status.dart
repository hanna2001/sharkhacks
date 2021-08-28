import 'package:flutter/material.dart';

class ViewStatus extends StatefulWidget {
  @override
  _ViewStatusState createState() => _ViewStatusState();
}

class _ViewStatusState extends State<ViewStatus> {
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
                    child: Text('Enter mobile number',
                        style: TextStyle(color: Color(0xFF130F27))),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: TextField(
                      showCursor: false,
                      cursorHeight: 30,
                      decoration: InputDecoration(
                          hintText: 'type here',
                          hintStyle: TextStyle(color: Colors.white),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 15),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          )),
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
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Material(
                      color: Color(0xFF3A70A3),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: MaterialButton(
                        onPressed: () {},
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
