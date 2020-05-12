import 'package:flutter/material.dart';
import 'package:mita_apps/views/account.dart';
import 'package:mita_apps/views/home.dart';
import 'package:mita_apps/views/message.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'auth/login.dart';
import 'auth/register.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login(),
      title: 'Mita Apps',
      debugShowCheckedModeBanner: false,
    );
  }
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

enum LoginStatus { notSignin, signIn }

class _LoginState extends State<Login> {
  LoginStatus _loginStatus = LoginStatus.notSignin;
  String pesan = "Login Gagal";
  bool login = true;
  @override
  void initState() {
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    switch (_loginStatus) {
      case LoginStatus.notSignin:
        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.orange[400],
                  Colors.pink[400],
                ],
              ),
            ),
            child: ListView(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.8,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFFffc247), Color(0xFFff249c)],
                    ),
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(90)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Spacer(),
                      Align(
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.polymer,
                          size: 70,
                          color: Colors.white,
                        ),
                      ),
                      Spacer(),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            bottom: 30,
                            right: 32,
                          ),
                          child: Text(
                            'Welcome',
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.5,
                    height: MediaQuery.of(context).size.height / 19,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width / 3.2,
                          height: MediaQuery.of(context).size.height / 19,
                          child: RaisedButton(
                            color: login == false ? Colors.grey : Colors.white,
                            splashColor: Colors.white10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            onPressed: () {
                              setState(() {
                                login = true;
                              });
                            },
                            child: Text("Exiting", style: TextStyle(
                              color: login == false ? Colors.white : Colors.black
                            ),),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 3.2,
                          height: MediaQuery.of(context).size.height / 19,
                          child: RaisedButton(
                            color: login == true ? Colors.grey : Colors.white,
                            splashColor: Colors.white10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            onPressed: () {
                              setState(() {
                                login = false;
                              });
                            },
                            child: Text(
                              "New",
                              style: TextStyle(color: login == true ? Colors.white : Colors.black,),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 8)),
                login == true ? LoginWidget(): RegisterWidget(),
              ],
            ),
          ),
        );
        break;
      case LoginStatus.signIn:
        break;
    }
  }
}

class HomePage extends StatefulWidget {
  // final VoidCallback signOut;
  // HomePage(this.signOut);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // signOut() {
  //   setState(() {
  //     widget.signOut();
  //   });
  // }

  String username = "";

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      username = preferences.getString("username");
    });
  }

  @override
  void initState() {
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: TabBarView(
          children: <Widget>[
            Home(),
            Message(),
            Account(),
          ],
        ),
        bottomNavigationBar: TabBar(
          labelPadding: EdgeInsets.all(7),
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(
              style: BorderStyle.none,
            ),
          ),
          labelColor: Color(0xFFfa5a19),
          unselectedLabelColor: Colors.grey,
          tabs: <Widget>[
            Tab(
              icon: Icon(
                Icons.home,
                size: 30,
              ),
            ),
            Tab(
              child: FaIcon(
                FontAwesomeIcons.solidCommentDots,
                size: 30,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.account_circle,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}