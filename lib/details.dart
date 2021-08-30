import 'package:flutter/material.dart';
import 'package:sharkhack/view_status2.dart';

class Details extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState();
}

details(w) {
  return ListView.builder(
      itemCount: rep.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.only(top: 20),
          child: ListTile(
              leading: Icon(Icons.book, size: 50, color: Colors.green),
              title: Text(rep[index]['country'] + "," + rep[index]['zipcode']),
              subtitle: Text(rep[index]['title']),
              trailing:
                  Text("status:\n" + checkhehe(rep[index]['isresolved']))),
        );
        // return ListTile(
        //     leading: Icon(Icons.list),
        //     trailing: IconButton(icon: Icon(Icons.remove)),
        //     title: Text("List item $index"));
      });
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Container(
      height: h,
      width: w,
      child: details(w),
    ));
  }
}
