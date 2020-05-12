import 'package:flutter/material.dart';

class RegisterWidget extends StatefulWidget {
  @override
  _RegisterWidgetState createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  String username, password;
    var _autovalidate = false;
    bool _secureText = true;
    final _key = GlobalKey<FormState>();
  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }
  @override
  Widget build(BuildContext context) {

    return Form(
      autovalidate: _autovalidate,
      key: _key,
      child: Column(
        children: <Widget>[
          Container(
            // margin: EdgeInsets.only(left: 20, right: 20),
//            height: MediaQuery.of(context).size.height / 2.9,
            width: MediaQuery.of(context).size.width / 1.1,
            padding: EdgeInsets.symmetric(vertical: 20.0),
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
                        return "Full Name is empty";
                      }
                    },
                    onSaved: (e) => username = e,
                    decoration: InputDecoration(
                      labelText: "Full Name",
                      // labelStyle: TextStyle(fontSize: 18),
                      icon: Icon(
                        Icons.person_outline,
                        size: 30,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
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
                      // labelStyle: TextStyle(fontSize: 18),
                      icon: Icon(
                        Icons.account_circle,
                        size: 30,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  margin: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 40.0),
                  child: TextFormField(
                    validator: (e){
                      if (e.isEmpty) {
                        return "Password is empty";
                      }
                    },
                    obscureText: _secureText,
                    onSaved: (e) => password = e,
                    decoration: InputDecoration(
                      labelText: "Password",
                      // labelStyle: TextStyle(fontSize: 18),
                      icon: Icon(
                        Icons.lock,
                        size: 30,
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
            height: MediaQuery.of(context).size.height / 12,
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
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: MediaQuery.of(context).size.height / 12,
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
                        fontSize: 20,
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
}