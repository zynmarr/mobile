import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
  bool verified = false;
  final List<String> imageList = [
      "assets/img/p1.jpg",
      "assets/img/p2.jpg",
      "assets/img/p3.jpg",
    ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                        icon: Icon(
                          Icons.settings,
                          size: 22.0,
                          color: Colors.black54,
                        ),
                        onPressed: () {}),
                    IconButton(
                        icon: Icon(
                          Icons.mode_edit,
                          size: 22.0,
                          color: Colors.black54,
                        ),
                        onPressed: () {}),
                  ],
                ),
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.verified_user), 
                        color: verified == true ? Color(0xFFfa5a19): Colors.grey, 
                        onPressed: (){},
                      ),
                      Text(verified == true ? "Verified Accounts" : "Unverified Account", style: TextStyle(fontSize: 14.0, color: Colors.black))
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.location_on), 
                        color: Color(0xFFfa5a19), 
                        onPressed: (){},
                      ),
                      Text("Jakarta, Indonesia",style: TextStyle(fontSize: 14.0, color: Colors.black))
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: CarouselSlider(
                  items: imageList.map((i) {
                  return Builder(
                    builder: (BuildContext context){
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        alignment: Alignment.center,
                        
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(20.0),
                          image: DecorationImage(image: AssetImage(i), fit: BoxFit.cover)
                        ),
                        child: Text('my photo $i', style: TextStyle(fontSize: 16.0, color: Colors.white),)
                      );
                    }
                  );
                }).toList(), 
                options: CarouselOptions(
                  height: 200.0,
                  enableInfiniteScroll: false,
                  scrollDirection: Axis.horizontal,
                  enlargeCenterPage: true,
                  initialPage: 0
                )),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
