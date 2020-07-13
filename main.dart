import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'View/Profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Login(),
    );
  }
}

class Login extends StatefulWidget {
  @override
  Login_State createState() => Login_State();
}

class Login_State extends State<Login> {
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 150, 10, 80),
          child: Card(
            elevation: 10.0,
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: <Widget>[
                      IconButton(icon: Icon(Icons.person), onPressed: null),
                      Expanded(
                          child: Container(
                              margin: EdgeInsets.only(right: 20, left: 10),
                              child: TextField(
                                decoration:
                                    InputDecoration(hintText: 'Username'),
                                controller: _username,
                              )))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: <Widget>[
                      IconButton(icon: Icon(Icons.lock), onPressed: null),
                      Expanded(
                          child: Container(
                              margin: EdgeInsets.only(right: 20, left: 10),
                              child: TextField(
                                decoration:
                                    InputDecoration(hintText: 'Password'),
                                obscureText: true,
                                controller: _password,
                              ))),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('Login'),
                      onPressed: () {
                        if (_username.text == "2570" &&
                            _password.text == "admin") {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => MyHomePage(
                                      username: _username.text,
                                      password: _password.text)));
                        }
                      },
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
