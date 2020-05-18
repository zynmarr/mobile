import 'package:flutter/material.dart';
import 'package:mita_apps/models/message_model.dart';
import 'package:mita_apps/views/recentMsg.dart';
import 'package:mita_apps/views/chatPage.dart';

class MessagePage extends StatefulWidget {
  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.only(left: 10),
              height: 75,
              child: Text(
                "Messages",
                style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Viga',
                    fontWeight: FontWeight.w400),
              ),
            ),
            Form(
              child: Container(
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[300],
                ),
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.search,
                        size: 30,
                        color: Colors.grey[700],
                      ),
                      hintText: "Search...",
                      border: InputBorder.none),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 0, bottom: 0),
              height: 10,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                      color: Colors.grey[300],
                      style: BorderStyle.solid,
                      width: 2.0),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 5, top: 5),
              height: 25,
              child: Text(
                "ONLINE USERS",
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Viga',
                  color: Colors.grey[700],
                ),
              ),
            ),
            Container(
              height: 90.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: likes.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext) => SendMsg(
                                    user: likes[index],
                                  )));
                                  print(likes[index].id);
                    },
                    child: onlineUser(likes[index].name, likes[index].imageUrl,
                        likes[index].online),
                  );
                },
              ),
            ),
            Container(
              // padding: EdgeInsets.only(top: 0, bottom: 0),
              height: 10,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey[300],
                    style: BorderStyle.solid,
                    width: 2.0,
                  ),
                ),
              ),
            ),
            RecentMsg(),
          ],
        ),
      ),
    );
  }
}

Widget onlineUser(String nama, image, bool check) {
  return Container(
    padding: EdgeInsets.only(
      top: 4,
    ),
    margin: EdgeInsets.only(left: 8),
    width: 70,
    child: Column(
      children: <Widget>[
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(150),
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.fill,
            ),
            // border: Border.all(color: Colors.lightGreenAccent[400], width: 2.0),
          ),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: EdgeInsets.only(right: 3, bottom: 3),
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color:
                    check == true ? Colors.lightGreenAccent[400] : Colors.grey,
                border: Border.all(color: Colors.white, width: 2.0),
              ),
            ),
          ),
        ),
        Center(
          child: Text(
            nama,
            style: TextStyle(
              fontSize: 12,
              fontFamily: 'Viga',
            ),
          ),
        ),
      ],
    ),
  );
}
