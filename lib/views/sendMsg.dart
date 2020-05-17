import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SendMsg extends StatefulWidget {
  @override
  _SendMsgState createState() => _SendMsgState();
}

class _SendMsgState extends State<SendMsg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Muammar Khadafi'),
        // actions: <Widget>[
        //   Icon(Icons.list),
        // ],
        // iconTheme: IconThemeData(color: Colors.black),
        // actionsIconTheme: IconThemeData(color: Colors.white),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.grey[200],
            ),
          ),
          Positioned(
            bottom: 2,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 8,
              padding: EdgeInsets.only(top: 18, bottom:20),
              // color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: 300,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Ketik Pesan",
                      ),
                    ),
                  ),
                  Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: InkWell(
                      onTap: () {
                        print('Send Msg');
                      },
                      child: Icon(
                        Icons.send,
                        size: 30,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
