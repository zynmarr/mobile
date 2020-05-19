import 'package:flutter/material.dart';
import 'package:mita_apps/models/user_model.dart';
import 'package:carousel_slider/carousel_slider.dart';

class UserProfile extends StatefulWidget {
  final User data;
  UserProfile({this.data});

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final List<String> imageList = [
    "assets/img/p1.jpg",
    "assets/img/p2.jpg",
    "assets/img/p3.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Row(
      //     children: <Widget>[
      //       Text(
      //         widget.data.name,
      //       ),
      //       Padding(
      //         padding: EdgeInsets.all(5),
      //       ),
      //       Icon(
      //         Icons.verified_user,
      //         color: widget.data.verified == true
      //             ? Color(0xFFfa5a19)
      //             : Colors.grey,
      //       ),
      //     ],
      //   ),
      // ),
      body: ListView(
        children: <Widget>[
          Container(
            alignment: Alignment.bottomLeft,
            height: MediaQuery.of(context).size.height / 3,
            decoration: BoxDecoration(
              color: Colors.amberAccent,
              image: DecorationImage(
                image: AssetImage(widget.data.imageUrl),
                fit: BoxFit.fill,
              ),
            ),
            child: Container(
              margin: EdgeInsets.only(left: 20, bottom: 10),
              child: Row(
                children: <Widget>[
                  Text(
                    widget.data.name,
                    style: TextStyle(
                        color: Colors.white, fontSize: 30, fontFamily: 'Viga'),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                  ),
                  Icon(
                    Icons.verified_user,
                    color: widget.data.verified == true
                        ? Color(0xFFfa5a19)
                        : Colors.grey,
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 6,
            // color: Colors.grey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Container(
                //   padding: EdgeInsets.only(top: 10, left: 10),
                //   child: Text(
                //     "About You :",
                //     style: TextStyle(fontSize: 17, fontFamily: 'Viga'),
                //   ),
                // ),
                Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(10),
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    // color: Colors.indigoAccent,
                    border: Border.all(
                      color: Colors.grey[300],
                      style: BorderStyle.solid,
                      width: 2.0,
                    ),
                  ),
                  child: widget.data.about != null
                      ? Text(
                          widget.data.about,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.black,
                            fontFamily: 'Viga',
                            letterSpacing: 1,
                          ),
                        )
                      : Text(
                          "data not loaded",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.black,
                          ),
                        ),
                ),
              ],
            ),
          ),
          Container(
            height: 50,
            // color: Colors.grey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  // alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(top: 0, left: 10),
                  child: Text(
                    "I'm here to ...",
                    // textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15.0, color: Colors.black),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 1, left: 10),
                  child: Text(
                    "- looking for friends",
                    style: TextStyle(fontSize: 17, fontFamily: 'Viga'),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 50,
            // color: Colors.grey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  // alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(top: 0, left: 10),
                  child: Text(
                    "Current Location",
                    // textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15.0, color: Colors.black),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 1, left: 10),
                  child: Text(
                    widget.data.location,
                    style: TextStyle(fontSize: 17, fontFamily: 'Viga'),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: CarouselSlider(
              items: imageList.map((i) {
                return Builder(builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(20.0),
                          image: DecorationImage(
                              image: AssetImage(i), fit: BoxFit.cover)),
                      child: Text(
                        'my photo $i',
                        style: TextStyle(fontSize: 16.0, color: Colors.white),
                      ));
                });
              }).toList(),
              options: CarouselOptions(
                height: 200.0,
                enableInfiniteScroll: false,
                scrollDirection: Axis.horizontal,
                enlargeCenterPage: true,
                initialPage: 0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
