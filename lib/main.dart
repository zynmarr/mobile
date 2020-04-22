import 'package:flutter/material.dart';
import 'package:mita_apps/conn/api.dart';
import 'package:mita_apps/views/account.dart';
import 'package:mita_apps/views/home.dart';
import 'package:mita_apps/views/message.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:io';
import 'package:getflutter/getflutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

  String username, password;

  final _key = GlobalKey<FormState>();

  bool _secureText = true;

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  var _autovalidate = false;

  check() {
    final form = _key.currentState;
    if (form.validate()) {
      form.save();
      login();
    } else {
      setState(() {
        _autovalidate = true;
      });
    }
  }

  String pesan = "";

  Future login() async {
    final response = await http.post(BaseUrl.login,
        body: {"username": username, "password": password});

    final data = jsonDecode(response.body);
    int value = data['value'];
    String usernameApi = data['username'];
    String idApi = data['id'];
    if (value == 1) {
      setState(() {
        _loginStatus = LoginStatus.signIn;
        savedPref(value, usernameApi, idApi);
      });
    } else {
      setState(() {
        pesan = "Username or Password invalid";
      });
    }
  }

  savedPref(int value, String username, String id) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt('value', value);
      preferences.setString('username', username);
      preferences.commit();
    });
  }

  var value;

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      value = preferences.getInt('value');

      _loginStatus = value == 1 ? LoginStatus.signIn : LoginStatus.notSignin;
    });
  }

  signOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt('value', null);
      preferences.setString('pesan', null);
      preferences.commit();
      _loginStatus = LoginStatus.notSignin;
    });
  }

  @override
  void initState() {
    super.initState();
    getPref();
  }

  Widget register() {
    return Form(
      autovalidate: _autovalidate,
      key: _key,
      child: Column(
        children: <Widget>[
          Container(
            // margin: EdgeInsets.only(left: 20, right: 20),
            height: 280,
            width: 320,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  margin: EdgeInsets.only(top: 5, left: 20, right: 20),
                  child: TextFormField(
                    validator: (e) {
                      if (e.isEmpty) {
                        return "Full Name is empty";
                      }
                    },
                    onSaved: (e) => username = e,
                    decoration: InputDecoration(
                      labelText: "Full Name",
                      icon: Icon(
                        Icons.person_outline,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  margin: EdgeInsets.only(top: 0, left: 20, right: 20),
                  child: TextFormField(
                    validator: (e) {
                      if (e.isEmpty) {
                        return "Username is empty";
                      }
                    },
                    onSaved: (e) => username = e,
                    decoration: InputDecoration(
                      labelText: "username",
                      icon: Icon(
                        Icons.account_circle,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  margin: EdgeInsets.only(top: 0, left: 20, right: 20),
                  child: TextFormField(
                    validator: (e) {
                      if (e.isEmpty) {
                        return "Password is empty";
                      }
                    },
                    obscureText: _secureText,
                    onSaved: (e) => password = e,
                    decoration: InputDecoration(
                      labelText: "Password",
                      icon: Icon(
                        Icons.lock,
                        color: Colors.black,
                      ),
                      suffixIcon: IconButton(
                        onPressed: showHide,
                        icon: Icon(_secureText
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 1.2,
            height: 50.0,
            margin: EdgeInsets.only(left: 40, right: 40),
            transform: Matrix4.translationValues(0.0, -25.0, 0.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            child: RaisedButton(
              splashColor: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              padding: const EdgeInsets.all(0.0),
              onPressed: () {
                check();
              },
              color: Colors.transparent,
              child: Ink(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                  gradient: LinearGradient(
                    colors: [Color(0xFFffc247), Color(0xFFff249c)],
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Register".toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _login() {
    return Form(
      autovalidate: _autovalidate,
      key: _key,
      child: Column(
        children: <Widget>[
          Container(
            // margin: EdgeInsets.only(left: 20, right: 20),
            height: 210,
            width: 320,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                  child: TextFormField(
                    validator: (e) {
                      if (e.isEmpty) {
                        return "Username is empty";
                      }
                    },
                    onSaved: (e) => username = e,
                    decoration: InputDecoration(
                      labelText: "username",
                      icon: Icon(
                        Icons.mail,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  margin: EdgeInsets.only(top: 5, left: 20, right: 20),
                  child: TextFormField(
                    validator: (e) {
                      if (e.isEmpty) {
                        return "Password is empty";
                      }
                    },
                    obscureText: _secureText,
                    onSaved: (e) => password = e,
                    decoration: InputDecoration(
                      labelText: "Password",
                      icon: Icon(
                        Icons.lock,
                        color: Colors.black,
                      ),
                      suffixIcon: IconButton(
                        onPressed: showHide,
                        icon: Icon(_secureText
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 1.2,
            height: 50.0,
            margin: EdgeInsets.only(left: 40, right: 40),
            transform: Matrix4.translationValues(0.0, -25.0, 0.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            child: RaisedButton(
              splashColor: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              padding: const EdgeInsets.all(0.0),
              onPressed: () {
                check();
              },
              color: Colors.transparent,
              child: Ink(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                  gradient: LinearGradient(
                    colors: [Color(0xFFffc247), Color(0xFFff249c)],
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Login".toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Viga',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 22,
            transform: Matrix4.translationValues(0.0, -15.0, 0.0),
            decoration: BoxDecoration(),
            child: Center(
              child: MaterialButton(
                onPressed: () {
                  print('Oke');
                },
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          Center(
            child: Text(
              "or",
              style: TextStyle(color: Colors.white),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
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
                Padding(padding: EdgeInsets.all(10)),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white),
                  child: IconButton(
                    icon: FaIcon(
                      FontAwesomeIcons.facebookF,
                      size: 25,
                      color: Colors.blue,
                    ),
                    onPressed: () {
                      print("Pressed");
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
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
                colors: [Colors.orange[400], Colors.pink[400]],
              ),
            ),
            child: ListView(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 215,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFFffc247), Color(0xFFff249c)],
                      ),
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(90))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Spacer(),
                      Align(
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.polymer,
                          size: 70.0,
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
                    height: 38,
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 115,
                          child: RaisedButton(
                            color: Colors.white,
                            splashColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            onPressed: () {},
                            child: Text("Exiting"),
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(3)),
                        Container(
                          width: 115,
                          child: RaisedButton(
                            color: Colors.transparent,
                            splashColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            onPressed: () {},
                            child: Text(
                              "New",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 8)),
                _login(),
              ],
            ),
          ),
        );
        break;
      case LoginStatus.signIn:
        return HomePage(signOut);
        break;
    }
  }
}

formLogin() {
  return null;
}

class HomePage extends StatefulWidget {
  final VoidCallback signOut;
  HomePage(this.signOut);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  signOut() {
    setState(() {
      widget.signOut();
    });
  }

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
            Account(signOut),
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
