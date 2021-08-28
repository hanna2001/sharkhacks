import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_slider/page_slider.dart';
import 'package:sharkhack/new_report3.dart';


class NewReport2 extends StatefulWidget {
  @override
  _NewReport2State createState() => _NewReport2State();
}

class _NewReport2State extends State<NewReport2>{
  Color topColor = Color(0xff5BA455);
  String stage = '2';
  String buttonText = 'Next';
  String country = 'Select';
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
            height: 150,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Container(
                  alignment : Alignment.topLeft,
                  padding: EdgeInsets.only(left:13, top:36),
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
                  alignment : Alignment.bottomLeft,
                  padding: EdgeInsets.only(left:31, top : 45),
                  child: Text(
                    'Steps '+stage + '/3',
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
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NewReport3()),
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

                alignment: Alignment.bottomRight,
                margin: EdgeInsets.only(bottom: 43,right: 35),

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
                children: [
                       Container(
                          alignment : Alignment.topLeft,
                          padding: EdgeInsets.only(left:31,top: 40,bottom: 10),
                                child: Text(
                              'Select Country',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                        ),


                 Container(
                    child: Row(
                        children: [
                          SizedBox(
                           width: MediaQuery.of(context).size.width/1.5,
                           child :
                               Text(
                                  country,
                                  style: TextStyle(color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18),
                               ),
                          ),
                            IconButton(
                              alignment: Alignment.centerRight,
                              icon: const Icon(Icons.arrow_downward),
                              color: Colors.white,
                              onPressed: () {
                                showCountryPicker(
                                  context: context,
                                  showPhoneCode: false, // optional. Shows phone code before the country name.
                                  onSelect: (Country country) {
                                    int index = country.displayName.indexOf('(');
                                    setState(() {
                                      this.country = country.displayName.substring(0,index);
                                    });

                                  },
                                );
                              },
                            ),
                          ],
                        ),
                    height : 75,
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(left: 20),
                    margin: EdgeInsets.only(left: 31,right: 23),
                    decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("images/textbg.png",),
                      ),
                    ),
                  ),
                  Container(
                    alignment : Alignment.topLeft,
                    padding: EdgeInsets.only(left:31,top: 40,bottom: 10),
                    child: Text(
                      'Enter Zip Code',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
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
                        hintText: 'Type here...',
                        hintStyle: TextStyle(
                          color : Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                        disabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                      ),
                      style : TextStyle( color : Colors.white),

                    ),
                    height: 75,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 20),
                    margin: EdgeInsets.only(left: 31,right: 23),
                    decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("images/textbg.png",),
                      ),
                    ),
                  ),

                  Container(
                    alignment : Alignment.topLeft,
                    padding: EdgeInsets.only(left:31,top: 40,bottom: 10, right : 31),
                    child: Text(
                      'Exact address of the place where problem exists',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Container(
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        hintText: 'Type here...',
                        hintStyle: TextStyle( color: Colors.white,),
                        disabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                      ),
                      style : TextStyle( color : Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 18),

                    ),
                    height: 75,
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(left: 20),
                    margin: EdgeInsets.only(left: 31,right: 23),
                    decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("images/textbg.png",),
                      ),
                    ),
                  )






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
