import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class Account extends StatefulWidget {
  final VoidCallback signOut;
  Account(this.signOut);
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  signOut() {
    setState(() {
      widget.signOut();
    });
  }

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
                  colors: [Color(0xFFffc247), Color(0xFFff249c)],
                ),
              ),
              child: Center(
                child: Container(
                  width: 150,
                  height: 150,
                  transform: Matrix4.translationValues(0, 90.0, 0),
                  padding: EdgeInsets.all(50),
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(100),
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
                    height: 70,
                    child: RaisedButton(
                      color: Colors.white,
                      onPressed: () {},
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.settings),
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
                    height: 70,
                    child: RaisedButton(
                      color: Colors.white,
                      onPressed: () {},
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.settings),
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
                    height: 70,
                    child: RaisedButton(
                      color: Colors.white,
                      onPressed: () {
                        signOut();
                      },
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.power_settings_new),
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
