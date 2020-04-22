import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:mita_apps/views/message.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
        image: Image.network(
          image,
          fit: BoxFit.fill,
          repeat: ImageRepeat.noRepeat,
          height: 280.0,
          width: MediaQuery.of(context).size.width,
        ),
        title: GFListTile(
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
            color: Colors.white,
            onPressed: () {
              print("Oke");
            },
            icon: Icon(
              Icons.info,
              color: Colors.grey,
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
      "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=80",
      "https://eugenephotographer.com/wp-content/uploads/2020/01/acting-headshots-for-Maddie-Blumm.jpg",
      "https://www.swamisantadasinstituteofculture.com/wp-content/uploads/2019/09/FakeDP.jpeg",
    ];

    return Scaffold(
      body: Container(
        // padding: EdgeInsets.only(bottom: 30),
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0xFFffc247), Color(0xFFff249c)],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Container(
                padding: EdgeInsets.only(left: 20, top: 30),
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
            Container(
              height: 440,
              transform: Matrix4.translationValues(0.0, -88.0, 0.0),
              child: Column(
                children: <Widget>[
                  Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return infoUser(nameList[index], imageList[index]);
                    },
                    itemHeight: 435,
                    itemWidth: 400,
                    layout: SwiperLayout.STACK,
                    itemCount: nameList.length,
                    scrollDirection: Axis.vertical,
                    loop: false,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    transform: Matrix4.translationValues(0.0, -90.0, 0.0),
                    // margin: EdgeInsets.only(bottom: 100),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.white),
                            child: IconButton(
                              icon: FaIcon(
                                FontAwesomeIcons.googlePlusG,
                                size: 25,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                print("Pressed");
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.white),
                            child: IconButton(
                              icon: FaIcon(
                                FontAwesomeIcons.googlePlusG,
                                size: 25,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                print("Pressed");
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.white),
                            child: IconButton(
                              icon: FaIcon(
                                FontAwesomeIcons.googlePlusG,
                                size: 25,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                print("Pressed");
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
          ],
        ),
      ),
    );
  }
}
