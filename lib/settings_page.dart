import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flushbar/flushbar.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => new _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final usernameController = TextEditingController();
  final ipController = TextEditingController();
  final passwordController = TextEditingController();
  final portController = TextEditingController();
  final tvPathController = TextEditingController();
  final moviePathController = TextEditingController();

  void _intial() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      usernameController.text = prefs.getString('username') ?? "";
      ipController.text = prefs.getString('ip') ?? "";
      passwordController.text = prefs.getString('password') ?? "";
      portController.text = prefs.getString('port') ?? "";
      tvPathController.text = prefs.getString('tvPath') ?? "";
      moviePathController.text = prefs.getString('moviePath') ?? "";
    });
  }

  @override
  void initState() {
    super.initState();
    _intial();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    usernameController.dispose();
    ipController.dispose();
    passwordController.dispose();
    portController.dispose();
    tvPathController.dispose();
    moviePathController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.black,
      title: 'Settings',
      home: Scaffold(
        // resizeToAvoidBottomPadding: false,
        body: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Center(child: Text("Settings", style: TextStyle(fontSize: 20))),
            Theme(
              data: new ThemeData(
                  primaryColor: Colors.green,
                  accentColor: Colors.orange,
                  hintColor: Colors.grey),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 10),
                  TextFormField(
                    controller: usernameController,
                    decoration: new InputDecoration(
                      labelText: "Enter Username",
                      fillColor: Colors.green,
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(60.0),
                        borderSide: new BorderSide(),
                      ),
                      //fillColor: Colors.green
                    ),
                    validator: (val) {
                      if (val.length == 0) {
                        return "Username cannot be empty";
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                    style: new TextStyle(
                      fontFamily: "Poppins",
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: ipController,
                    decoration: new InputDecoration(
                      labelText: "Enter IP Address",
                      fillColor: Colors.green,
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(60.0),
                        borderSide: new BorderSide(),
                      ),
                      //fillColor: Colors.green
                    ),
                    validator: (val) {
                      if (val.length == 0) {
                        return "IP cannot be empty";
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.numberWithOptions(),
                    style: new TextStyle(
                      fontFamily: "Poppins",
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: portController,
                    decoration: new InputDecoration(
                      labelText: "Enter Port Number",
                      fillColor: Colors.green,
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(60.0),
                        borderSide: new BorderSide(),
                      ),
                      //fillColor: Colors.green
                    ),
                    validator: (val) {
                      if (val.length == 0) {
                        return "port cannot be empty";
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.number,
                    style: new TextStyle(
                      fontFamily: "Poppins",
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: passwordController,
                    decoration: new InputDecoration(
                      labelText: "Enter Password",
                      fillColor: Colors.green,
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(60.0),
                        borderSide: new BorderSide(),
                      ),
                      //fillColor: Colors.green
                    ),
                    validator: (val) {
                      if (val.length == 0) {
                        return "Password cannot be empty";
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                    style: new TextStyle(
                      fontFamily: "Poppins",
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: moviePathController,
                    decoration: new InputDecoration(
                      labelText: "Path to save movies in server",
                      hintText: "/home/<username>/<movie folder name>",
                      fillColor: Colors.green,
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(60.0),
                        borderSide: new BorderSide(),
                      ),
                      //fillColor: Colors.green
                    ),
                    validator: (val) {
                      if (val.length == 0) {
                        return "path cannot be empty";
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                    style: new TextStyle(
                      fontFamily: "Poppins",
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: tvPathController,
                    decoration: new InputDecoration(
                      labelText: "Path to save TV shows in server",
                      hintText: "/home/<username>/<tv folder name>",
                      fillColor: Colors.green,
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(60.0),
                        borderSide: new BorderSide(),
                      ),
                      //fillColor: Colors.green
                    ),
                    validator: (val) {
                      if (val.length == 0) {
                        return "path cannot be empty";
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                    style: new TextStyle(
                      fontFamily: "Poppins",
                    ),
                  ),
                  SizedBox(height: 10),
                  FlatButton(
                    onPressed: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setString('username', usernameController.text);
                      prefs.setString('ip', ipController.text);
                      prefs.setString('password', passwordController.text);
                      prefs.setString('port', portController.text);
                      prefs.setString('moviePath', moviePathController.text);
                      prefs.setString('tvPath', tvPathController.text);
                      _intial();
                      return Flushbar(
                        backgroundColor: Colors.green,
                        title: "Success",
                        isDismissible: true,
                        message: "settings saved succesfully",
                        duration: Duration(seconds: 3),
                      )..show(context);
                    },
                    child: Icon(
                      Icons.save,
                      color: Colors.green,
                      size: 70,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
