import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:testing1212/models/Patient.dart';
import 'package:testing1212/models/services.dart';
import 'package:testing1212/widget/snackbar.dart';
import '/data/img.dart';
import '/data/my_colors.dart';
import '/widget/my_text.dart';
import 'package:http/http.dart' as http;

class LoginCardOverlapRoute extends StatefulWidget {
  const LoginCardOverlapRoute();

  @override
  LoginCardOverlapRouteState createState() => LoginCardOverlapRouteState();
}

class LoginCardOverlapRouteState extends State<LoginCardOverlapRoute> {
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();

  Future Login(BuildContext cont) async {
    if (_emailcontroller.text == "" || _passwordcontroller.text == "") {
      snackBar.show(
          context, "username and password must be filled", Colors.red);
    } else {
      var loginUrl = "http://192.168.190.137/lasthit/loginapi.php";
      final response = await http.post(Uri.parse(loginUrl), body: {
        "email": _emailcontroller.text,
        "password": _passwordcontroller.text
      });

      var data = jsonDecode(response.body);
      if (data == "loginfail") {
        snackBar.show(context, "Incorrect USERNAME and PASSWORD", Colors.red);
      } else {
        //first get the user email from the curent login json an make another api request to get the patient Id
        String email = data[0]['email'];
        const String patienturl =
            "http://192.168.100.4/lasthit/patientGetData.php";

        final patientResponse =
            await http.post(Uri.parse(patienturl), body: {"email": email});
        var patientdata = jsonDecode(patientResponse.body);
        String patientid = patientdata[0]['id'];
        Navigator.of(context).pop();
        Navigator.of(cont).pushNamed('/booking', arguments: patientid);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: Container(color: MyColors.primary)),
      body: Stack(
        children: <Widget>[
          Container(color: MyColors.primary, height: 220),
          Column(
            children: <Widget>[
              Container(height: 40),
              SizedBox(
                width: 80,
                height: 80,
                child: Image.asset(
                  Img.get('logo_small_circle.png'),
                ),
              ),
              Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                  margin: const EdgeInsets.all(25),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(height: 25),
                        Text("SIGN IN",
                            style: MyText.title(context)!.copyWith(
                                color: Colors.green[500],
                                fontWeight: FontWeight.bold)),
                        TextField(
                          controller: _emailcontroller,
                          keyboardType: TextInputType.text,
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            labelText: "Email",
                            labelStyle: TextStyle(color: Colors.blueGrey[400]),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.blueGrey[400]!, width: 1),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.blueGrey[400]!, width: 2),
                            ),
                          ),
                        ),
                        Container(height: 25),
                        TextField(
                          controller: _passwordcontroller,
                          keyboardType: TextInputType.visiblePassword,
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            labelText: "Password",
                            labelStyle: TextStyle(color: Colors.blueGrey[400]),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.blueGrey[400]!, width: 1),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.blueGrey[400]!, width: 2),
                            ),
                          ),
                        ),
                        Container(height: 15),
                        SizedBox(
                          width: double.infinity,
                          height: 40,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: MyColors.primary,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            child: const Text(
                              "SUBMIT",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              FocusScopeNode currentFocus =
                                  FocusScope.of(context);

                              if (!currentFocus.hasPrimaryFocus) {
                                currentFocus.unfocus();
                              }
                              Login(context);
                            },
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          child: TextButton(
                            style: TextButton.styleFrom(
                                foregroundColor: Colors.transparent),
                            child: const Text(
                              "New user? Sign Up",
                              style: TextStyle(color: MyColors.primaryLight),
                            ),
                            onPressed: () {
                              Navigator.of(context).pushNamed('/register');
                            },
                          ),
                        ),
                      ],
                    ),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
