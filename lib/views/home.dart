import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:mita_apps/views/message.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/rendering.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    /* Card */
    Widget infoUser(String listName, image) {
      return GFCard(
        height: MediaQuery.of(context).size.height,
        image: Image.asset(
          image,
          fit: BoxFit.fill,
          repeat: ImageRepeat.noRepeat,
          height: MediaQuery.of(context).size.height / 2.5,
          width: MediaQuery.of(context).size.width,
        ),
        title: GFListTile(
          margin: EdgeInsets.all(10),
          // color: Colors.green,
          title: Text(
            listName,
            style: TextStyle(
              fontFamily: "Viga",
              fontSize: 20,
            ),
          ),
          subTitle: Text(
            'Office Manager',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          description: Text(
            "3 Mutual Friends",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          icon: GFIconButton(
            onPressed: () {
              setState(() {
                print("Info");
              });
            },
            color: GFColors.INFO,
            icon: Icon(
              Icons.info,
              size: 20,
            ),
          ),
        ),
      );
    }

    final List<String> nameList = [
      "Muammar Khadafi, 25",
      "Sean Potter, 19",
      "Jhon Erwill, 20",
    ];

    final List<String> imageList = [
      "assets/img/p1.jpg",
      "assets/img/p2.jpg",
      "assets/img/p3.jpg",
    ];

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        // padding: EdgeInsets.only(bottom: 30),
        color: Colors.grey[100],
        child: Stack(
          children: <Widget>[
            Positioned(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 4,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Colors.blueAccent, Colors.blue],
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.only(left: 20, top: 60),
                  child: Text(
                    "Discover",
                    style: TextStyle(
                      fontFamily: "Viga",
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // height: MediaQuery.of(context).size.height /2,
              child: Container(
                height: MediaQuery.of(context).size.height,
                // color: Colors.black,
                // transform: Matrix4.translationValues(0.0, 50.0, 0.0),
                padding: EdgeInsets.only(top: 60),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 0),
                      transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                      child: Swiper(
                        itemBuilder: (BuildContext context, int index) {
                          return infoUser(nameList[index], imageList[index]);
                        },
                        itemHeight: MediaQuery.of(context).size.height / 1.6,
                        itemWidth: MediaQuery.of(context).size.height,
                        layout: SwiperLayout.TINDER,
                        itemCount: nameList.length,
                        scrollDirection: Axis.horizontal,
                        loop: true,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 8,
                      transform: Matrix4.translationValues(0.0, -30.0, 0.0),
                      // margin: EdgeInsets.only(bottom: 100),
                      color: Colors.grey[400],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Expanded(
                            flex: 20,
                            child: Container(
                              width: 50,
                              height: 50,
                              margin: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.grey[200],
                                border: Border.all(
                                  color: Colors.grey,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              child: IconButton(
                                icon: FaIcon(
                                  FontAwesomeIcons.share,
                                  size: 18,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  print("Share");
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 60,
                            child: ClipPath(
                              clipper: MyClipper(),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                                // margin: EdgeInsets.all(10),
                                margin: EdgeInsets.all(5),
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.black,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width / 5,
                                      height:
                                          MediaQuery.of(context).size.height,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Colors.white,
                                        border: Border.all(
                                          color: Colors.grey,
                                          style: BorderStyle.solid,
                                        ),
                                      ),
                                      child: IconButton(
                                        icon: FaIcon(
                                          FontAwesomeIcons.times,
                                          size: 40,
                                          color: Colors.red,
                                        ),
                                        onPressed: () {
                                          print("Close");
                                        },
                                      ),
                                    ),
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width / 5,
                                      height:
                                          MediaQuery.of(context).size.height,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Colors.white,
                                        border: Border.all(
                                          color: Colors.grey,
                                          style: BorderStyle.solid,
                                        ),
                                      ),
                                      child: IconButton(
                                        icon: FaIcon(
                                          FontAwesomeIcons.solidHeart,
                                          size: 40,
                                          color: Colors.red,
                                        ),
                                        onPressed: () {
                                          print("Love");
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 20,
                            child: Container(
                              width: 50,
                              height: 50,
                              margin: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.grey[200],
                                border: Border.all(
                                  color: Colors.grey,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              child: IconButton(
                                icon: FaIcon(
                                  FontAwesomeIcons.star,
                                  size: 18,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  print("Like");
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    // var controllPoint = Offset(50, size.height);
    // var endPoint = Offset(size.width/2, size.height);
    // path.quadraticBezierTo(10, size.height, size.width/ 2, size.height);
    // path.lineTo(size.width, size.height);
    // path.lineTo(size.width/2, size.height);
    path.lineTo(size.width-187, size.height);
    path.quadraticBezierTo(size.width/2, size.height-50,size.width-48, size.height);
    // path.lineTo(0, size.height);
    // path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    // path.quadraticBezierTo(size.width/2, size.height-50,size.width, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
