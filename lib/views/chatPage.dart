import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mita_apps/main.dart';
import 'package:mita_apps/models/message_model.dart';
import 'package:mita_apps/models/user_model.dart';

class SendMsg extends StatefulWidget {
  final User user;
  SendMsg({this.user});

  @override
  _SendMsgState createState() => _SendMsgState();
}

class _SendMsgState extends State<SendMsg> {
  String pesan;

  bool btnSend = false;

  enable() {
    setState(() {
      btnSend = true;
    });
  }

  bool _autoValidate = true;

  final _key = GlobalKey<FormState>();

  Widget getMsg(pesan) {
    return Container(
      margin: EdgeInsets.only(top: 30, left: 10),
      alignment: Alignment.centerLeft,
      child: Baseline(
        baseline: 1,
        baselineType: TextBaseline.alphabetic,
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
          ),
          child: Text(
            pesan,
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }

  Widget sendMsg(send) {
    return Container(
      margin: EdgeInsets.only(top: 25, right: 10),
      alignment: Alignment.centerRight,
      child: Baseline(
        baseline: 2,
        baselineType: TextBaseline.alphabetic,
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.orange[300],
          ),
          child: Text(
            send,
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }

  kirim() {
    if (_key.currentState.validate()) {
      _key.currentState.save();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.user.name),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.more_vert,
              size: 30.0,
            ),
            onPressed: () {},
          ),
        ],
        iconTheme: IconThemeData(color: Colors.black),
        actionsIconTheme: IconThemeData(color: Colors.white),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.only(top: 10),
              color: Colors.grey[200],
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (BuildContext context, int index) {
                  final message = messages[index];
                  final bool isMe = message.sender.id == currentUser.id;
                  return isMe ? sendMsg(message.text) : getMsg(message.text);
                },
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
                mainAxisAlignment: btnSend == false
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Form(
                    autovalidate: _autoValidate,
                    key: _key,
                    child: Container(
                      height: 45,
                      width: btnSend == false ? 370 : 300,
                      padding: EdgeInsets.only(left: 5, right: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        // borderRadius: BorderRadius.circular(50),
                      ),
                      child: TextFormField(
                        maxLines: 2,
                        onChanged: (bool) {
                          enable();
                        },
                        onSaved: (e) {
                          pesan = e;
                        },
                        validator: (e) {
                          if (e.isNotEmpty) {
                            return null;
                          }
                          return null;
                        },
                        // maxLength: 50,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Ketik Pesan",
                        ),
                      ),
                    ),
                  ),
                  btnSend == false
                      ? Padding(
                          padding: EdgeInsets.all(0),
                        )
                      : Container(
                          width: 55,
                          height: 55,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: InkWell(
                            onTap: () {
                              kirim();
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
