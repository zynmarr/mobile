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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                      icon: Icon(
                        Icons.settings,
                        size: 20.0,
                        color: Colors.black54,
                      ),
                      onPressed: () {}),
                  IconButton(
                      icon: Icon(
                        Icons.mode_edit,
                        size: 20.0,
                        color: Colors.black54,
                      ),
                      onPressed: () {}),
                ],
              ),
              Container(
                width: 120.0,
                height: 120.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(150.0),
                    border: Border.all(color: Color(0xFFfa5a19), width: 0.5),
                    image: DecorationImage(
                        image: AssetImage('assets/img/p3.jpg'),
                        fit: BoxFit.cover)),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Color(0xFFfa5a19),
                    ),
                    child: IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.add_a_photo,
                          size: 14.0, color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.8,
                child: Column(
                  children: <Widget>[
                    Text(
                      "John Alexa, 23",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      '" Jadilah pribadi yang menantang masa depan, bukan pengecut yang aman di zona nyaman "',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12.0, color: Colors.black45),
                    ),
                  ],
                ),
              ),
              Row(
                children: <Widget>[],
              )
            ],
          ),
        ),
      ),
    );
  }
}
