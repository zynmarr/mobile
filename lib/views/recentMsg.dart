import 'package:flutter/material.dart';
import 'package:mita_apps/models/message_model.dart';
import 'package:mita_apps/views/chatPage.dart';

class RecentMsg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget showMessage(String name, image, time, message, bool read, data) {
      return Container(
        height: 82,
        child: RaisedButton(
          color: Colors.white,
          shape: RoundedRectangleBorder(
              side: BorderSide(
                  style: BorderStyle.solid, color: Colors.grey[300])),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext)=> SendMsg(user: data)));
          },
          child: Row(
            children: <Widget>[
              Container(
                child: Container(
                  width: 65,
                  height: 65,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(150),
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.fill,
                    ),
                    // border: Border.all(color: Colors.lightGreenAccent[400], width: 2.0),
                  ),
                  // child: ,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
              ),
              Expanded(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 18),
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          name,
                          style: TextStyle(
                            fontSize: 17.0,
                            fontFamily: "Viga",
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          message,
                          style: TextStyle(
                            fontSize: 13.0,
                            color: read == true ? Colors.grey : Colors.black,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    time,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(4),
                  ),
                  read == false
                      ? Text(
                          "New",
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      : SizedBox(),
                ],
              ),
            ],
          ),
        ),
      );
    }

    return Expanded(
      child: Container(
        child: ListView.builder(
          itemCount: chats.length,
          itemBuilder: (BuildContext context, int index) {
            final Message chat = chats[index];
            return Container(
              transform: Matrix4.translationValues(0.0, -22.0, 0.0),
              child: showMessage(chat.sender.name, chat.sender.imageUrl,
                  chat.time, chat.text, chat.unread, chat.sender),
            );
          },
        ),
      ),
    );
  }
}
