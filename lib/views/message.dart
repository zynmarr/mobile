import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';

class Message extends StatefulWidget {
  @override
  _MessageState createState() => _MessageState();
}

Widget showMessage(String name, image, count, time, message) {
  return Container(
    height: 82,
    child: RaisedButton(
      color: Colors.white,
      shape: RoundedRectangleBorder(
          side: BorderSide(style: BorderStyle.solid, color: Colors.grey[300])),
      onPressed: () {},
      child: Row(
        children: <Widget>[
          Container(
            child: Container(
              width: 65,
              height: 65,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(150),
                image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.fill,
                ),
                // border: Border.all(color: Colors.lightGreenAccent[400], width: 2.0),
              ),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  margin: EdgeInsets.only(right: 0, bottom: 0),
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    gradient: LinearGradient(
                      colors: [Color(0xFFffc247), Color(0xFFff249c)],
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                    ),
                    border: Border.all(color: Colors.white, width: 2.0),
                  ),
                  child: Center(
                    child: Text(
                      count,
                      style: TextStyle(
                          fontSize: 10,
                          fontFamily: "Viga",
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
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
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Text(
            time,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 10,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget searchUser(String name, image) {
  return Container(
    height: 70,
    child: Row(
      children: <Widget>[
        Container(
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(150),
              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.fill,
              ),
              // border: Border.all(color: Colors.lightGreenAccent[400], width: 2.0),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
        ),
        Container(
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 25),
                alignment: Alignment.bottomLeft,
                child: Text(
                  name,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontFamily: "Viga",
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

/* Form Search */
// Form(
//   child: Container(
//     height: 65,
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(10),
//       color: Colors.grey[300],
//     ),
//     padding: EdgeInsets.all(10),
//     child: TextFormField(
//       decoration: InputDecoration(
//           icon: Icon(
//             Icons.search,
//             size: 30,
//             color: Colors.grey[700],
//           ),
//           hintText: "Search...",
//           border: InputBorder.none),
//     ),
//   ),
// ),

List list = [
  "Muammar Khadafi",
  "Sean Potter",
  "Jane Williams",
];

class _MessageState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 5, top: 10),
              height: 60,
              child: Text(
                "Messages",
                style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Viga',
                    fontWeight: FontWeight.w400),
              ),
            ),
            GFSearchBar(
              searchList: list,
              searchQueryBuilder: (query, list) {
                return list
                    .where((item) =>
                        item.toLowerCase().contains(query.toLowerCase()))
                    .toList();
              },
              overlaySearchListItemBuilder: (item) {
                return searchUser(item, "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRinY4vLmj_JVTSedukEYnvTIWLVZFvY__GWupSreUQEkVnNw2H&usqp=CAU");
              },
              onItemSelected: (item) {
                setState(() {
                  print('$item');
                });
              },
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
              height: 80.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  onlineUser(
                    "Kyle",
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRinY4vLmj_JVTSedukEYnvTIWLVZFvY__GWupSreUQEkVnNw2H&usqp=CAU",
                  ),
                  onlineUser(
                    "Hyle",
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTk2E0REGTi4yBPIiTCSMuvaG0XYktXq34S4gA-0xsE_CLKexuS&usqp=CAU",
                  ),
                  onlineUser(
                    "Jhon",
                    "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=80",
                  ),
                  onlineUser(
                    "Jason",
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/Circle-icons-profile.svg/1200px-Circle-icons-profile.svg.png",
                  ),
                  onlineUser(
                    "Michael",
                    "https://lh3.googleusercontent.com/proxy/nmAjgJMnAkfCWaUmVgj-ZG70hzp6Ri-4iyHk_3CcApr_3YEnzPOs1S3zi2rED02IfbeR28d5dUrCcoAVIp8o-fp7_7ToO3I",
                  ),
                  onlineUser(
                    "Muammar",
                    "https://cdn2.vectorstock.com/i/thumb-large/34/96/flat-busness-man-user-profile-avatar-in-suit-vector-4333496.jpg",
                  ),
                ],
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
              margin: EdgeInsets.only(bottom: 0),
              child: Column(
                children: <Widget>[
                  showMessage(
                    "Muammar Khadafi",
                    "https://lh3.googleusercontent.com/proxy/nmAjgJMnAkfCWaUmVgj-ZG70hzp6Ri-4iyHk_3CcApr_3YEnzPOs1S3zi2rED02IfbeR28d5dUrCcoAVIp8o-fp7_7ToO3I",
                    "2",
                    "10.00",
                    "Welcome to my aplication",
                  ),
                  showMessage(
                    "Sean Potter",
                    "https://eugenephotographer.com/wp-content/uploads/2020/01/acting-headshots-for-Maddie-Blumm.jpg",
                    "10",
                    "10.00",
                    "What kind of music do you like?",
                  ),
                  showMessage(
                    "Stefan",
                    "https://www.swamisantadasinstituteofculture.com/wp-content/uploads/2019/09/FakeDP.jpeg",
                    "20",
                    "10.00",
                    "How are you?",
                  ),
                  showMessage(
                    "David Williams",
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/Circle-icons-profile.svg/1200px-Circle-icons-profile.svg.png",
                    "2",
                    "10.00",
                    "Welcome to my aplication",
                  ),
                  showMessage(
                    "Muammar Khadafi",
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/Circle-icons-profile.svg/1200px-Circle-icons-profile.svg.png",
                    "2",
                    "10.00",
                    "Welcome to my aplication",
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

Widget onlineUser(String nama, image) {
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
              image: NetworkImage(image),
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
                color: Colors.lightGreenAccent[400],
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
