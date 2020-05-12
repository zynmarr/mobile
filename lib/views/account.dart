import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Account extends StatefulWidget {
  // final VoidCallback signOut;
  // Account(this.signOut);
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  // signOut() {
  //   setState(() {
  //     widget.signOut();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3.5,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF2facfe), Color(0xFF2acfff)],
                ),
              ),
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width / 2.5,
                  height: MediaQuery.of(context).size.width / 2.5,
                  transform: Matrix4.translationValues(0, 90.0, 0),
                  padding: EdgeInsets.all(50),
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(100),
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQxw7cULzZFMCUW9iQQKn9zjvdLhuk2QwEKRIYMY40uQpAUfhE1&usqp=CAU'),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 70),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height/ 10,
                    child: RaisedButton(
                      color: Colors.white,
                      onPressed: () {
                        print("oke");
                      },
                      child: Row(
                        children: <Widget>[
                          Icon(FontAwesomeIcons.cog),
                          Padding(
                            padding: EdgeInsets.only(left: 5),
                          ),
                          Text("Setting")
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 3),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height/ 10,
                    child: RaisedButton(
                      color: Colors.white,
                      onPressed: () {},
                      child: Row(
                        children: <Widget>[
                          Icon(FontAwesomeIcons.paperPlane),
                          Padding(
                            padding: EdgeInsets.only(left: 5),
                          ),
                          Text("Feedback")
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 3),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height/ 10,
                    child: RaisedButton(
                      color: Colors.white,
                      onPressed: () {},
                      child: Row(
                        children: <Widget>[
                          Icon(FontAwesomeIcons.bell),
                          Padding(
                            padding: EdgeInsets.only(left: 5),
                          ),
                          Text("Notification")
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 3),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height/ 10,
                    child: RaisedButton(
                      color: Colors.white,
                      onPressed: () {
                        // signOut();
                      },
                      child: Row(
                        children: <Widget>[
                          Icon(FontAwesomeIcons.powerOff),
                          Padding(
                            padding: EdgeInsets.only(left: 5),
                          ),
                          Text("Log Out")
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
