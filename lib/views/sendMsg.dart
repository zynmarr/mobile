import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SendMsg extends StatefulWidget {
  @override
  _SendMsgState createState() => _SendMsgState();
}


var sendPesan = "";
var getpesan = null;

class _SendMsgState extends State<SendMsg> {

  Widget GetMsg(pesan) {
    return Container(
      margin: EdgeInsets.only(top: 25, left: 15),
      padding: EdgeInsets.only(right: MediaQuery.of(context).size.width / 3),
      // height: MediaQuery.of(context).size.height,
      child: Baseline(
        baseline: 1,
        baselineType: TextBaseline.alphabetic,
        child: Container(
          // height: 20,
          padding: EdgeInsets.all(5),

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.lightBlue,
          ),
          child: Text(
            pesan,
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }

  Widget SendMsg() {
    return Container(
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 3),
      margin: EdgeInsets.only(top: 25),
      child: Baseline(
        baseline: 2,
        baselineType: TextBaseline.alphabetic,
        child: Container(
          // height: 20,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.lightBlue,
          ),
          child: Text(
            "Ut non ipsum labore commodo. Fugiat exercitation velit consequat qui",
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }

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
              padding: EdgeInsets.only(top: 10),
              color: Colors.grey[200],
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  GetMsg(getpesan),
                  SendMsg(),
                  // GetMsg(),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 2,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 8,
              // margin: EdgeInsets.only(top: 18, bottom: 20),
              // color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    height: 45,
                    width: 300,
                    padding: EdgeInsets.only(left: 5, right: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      // borderRadius: BorderRadius.circular(50),
                    ),
                    child: TextFormField(
                      maxLines: 2,
                      // maxLength: 50,
                      decoration: InputDecoration(
                        border: InputBorder.none,
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
