import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sharkhack/view_status.dart';
import 'package:pie_chart/pie_chart.dart';

class ViewStatus2 extends StatefulWidget {
  @override
  _ViewStatusState2 createState() => _ViewStatusState2();
}

List<dynamic> rep;
Map<String, double> dataMap = {
  "in progress": 5,
  "resolved": 3,
};

class _ViewStatusState2 extends State<ViewStatus2> {
  void x() {
    FirebaseFirestore.instance
        .collection("users")
        .doc(mobile)
        .get()
        .then((value) => {
              setState(() {
                rep = List.from(value.data()['reports']);
              })
            });
  }

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
                  'Step 2/2',
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
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(70),
                color: Colors.white,
              ),
              child: Column(
                children: <Widget>[
                  PieChart(
                    dataMap: dataMap,
                    animationDuration: Duration(milliseconds: 800),
                    chartType: ChartType.ring,
                  ),
                  Text(rep.toString())
                ],
              ),
              height: MediaQuery.of(context).size.height / 1.6,
              width: MediaQuery.of(context).size.width,
            ),
          ),
        ],
      ),
    );
  }
}
