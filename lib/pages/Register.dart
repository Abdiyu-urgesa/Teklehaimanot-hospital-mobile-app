import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/data/my_colors.dart';
import '/widget/my_text.dart';
import 'package:http/http.dart' as http;
import 'package:testing1212/widget/snackbar.dart';
import 'dart:convert';

class RegisterPage extends StatefulWidget {
  RegisterPage();

  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  final _fnamecontroller = TextEditingController();
  final _lnamecontroller = TextEditingController();
  final _midlenamecontroller = TextEditingController();
  final _motheernamecontroller = TextEditingController();
  final _nationalIdcontroller = TextEditingController();
  final _agecontroller = TextEditingController();
  DateTime? forintializaton;
  String? _sexcontroller;
  final _mobilecontroller = TextEditingController();
  final _altmobilecontroller = TextEditingController();
  final _regioncontroller = TextEditingController();
  final _citycontroller = TextEditingController();
  final _subcitycontroller = TextEditingController();
  final _woredacontroller = TextEditingController();
  final _housenumcontroller = TextEditingController();
  final _officetelcontroller = TextEditingController();
  final _organzationcontroller = TextEditingController();
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  final _repasswordcontroller = TextEditingController();

  Future Register(BuildContext cont) async {
    if (_emailcontroller.text == "" || _passwordcontroller.text == "") {
      snackBar.show(
          context, "username and password must be filled", Colors.red);
    } else {
      if (_passwordcontroller.text == _repasswordcontroller.text) {
        var loginUrl = "http://192.168.100.4/lasthit/Register.php";
        final response = await http.post(Uri.parse(loginUrl), body: {
          "email": _emailcontroller.text,
          "password": _passwordcontroller.text,
        });

        var data = jsonDecode(response.body);
        if (data == "registerfail") {
          snackBar.show(
              context, "username or email already exsists", Colors.red);
        } else {
          print(
              "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
          Navigator.of(cont).pushNamed('/');
          snackBar.show(
              context,
              "Successfully Registered Your account is at pending",
              Colors.green);
        }
      } else {
        snackBar.show(context, "password and Retyped password must be the same",
            Colors.red);
      }
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.grey_5,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        foregroundColor: Colors.blue,
        backgroundColor: Colors.white,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
        title: const Text("Register"),
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        scrollDirection: Axis.vertical,
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(height: 5),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 43,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: TextField(
                          maxLines: 1,
                          controller: _fnamecontroller,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(-12),
                              border: InputBorder.none,
                              hintText: "First Name",
                              hintStyle: MyText.body1(context)!
                                  .copyWith(color: MyColors.grey_40)),
                        ),
                      ),
                    ),
                    Container(width: 10),
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 43,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: TextField(
                          maxLines: 1,
                          controller: _midlenamecontroller,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(-12),
                              border: InputBorder.none,
                              hintText: "Middle Name",
                              hintStyle: MyText.body1(context)!
                                  .copyWith(color: MyColors.grey_40)),
                        ),
                      ),
                    )
                  ],
                ),
                Container(height: 15),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 43,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: TextField(
                          maxLines: 1,
                          controller: _lnamecontroller,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(-12),
                              border: InputBorder.none,
                              hintText: "Last Name",
                              hintStyle: MyText.body1(context)!
                                  .copyWith(color: MyColors.grey_40)),
                        ),
                      ),
                    ),
                    Container(width: 15),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 43,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: TextField(
                          maxLines: 1,
                          controller: _nationalIdcontroller,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(-12),
                              border: InputBorder.none,
                              hintText: "National ID",
                              hintStyle: MyText.body1(context)!
                                  .copyWith(color: MyColors.grey_40)),
                        ),
                      ),
                    )
                  ],
                ),
                Container(height: 15),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 43,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: TextField(
                          keyboardType: TextInputType.datetime,
                          maxLines: 1,
                          controller: _motheernamecontroller,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(-12),
                              border: InputBorder.none,
                              hintText: "Mother Name",
                              hintStyle: MyText.body1(context)!
                                  .copyWith(color: MyColors.grey_40)),
                        ),
                      ),
                    ),
                    Container(width: 15),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 43,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: TextField(
                          maxLines: 1,
                          controller: TextEditingController(),
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(-12),
                              border: InputBorder.none,
                              hintText:
                                  "Birthday ${forintializaton.toString()}",
                              hintStyle: MyText.body1(context)!
                                  .copyWith(color: MyColors.grey_40)),
                          onTap: () async {
                            DateTime? newdate = await showDatePicker(
                                context: context,
                                initialDate: DateTime(2022),
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2100));

                            if (newdate == null) return;
                            setState(() {
                              forintializaton = newdate;
                            });
                          },
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  height: 15,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 43,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: TextField(
                          keyboardType: TextInputType.datetime,
                          maxLines: 1,
                          controller: _agecontroller,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(-12),
                              border: InputBorder.none,
                              hintText: "Age",
                              hintStyle: MyText.body1(context)!
                                  .copyWith(color: MyColors.grey_40)),
                        ),
                      ),
                    ),
                    Container(width: 15),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 43,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            items: const [
                              DropdownMenuItem(
                                  child: Text('male'), value: 'male'),
                              DropdownMenuItem(
                                  child: Text('female'), value: 'female')
                            ],
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                            hint: const Text("Sex"),
                            isExpanded: true,
                            value: _sexcontroller,
                            onChanged: (_sexcontroller) {
                              setState(() {
                                this._sexcontroller = _sexcontroller;
                              });
                            },
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Container(height: 15),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 43,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: TextField(
                          maxLines: 1,
                          controller: _mobilecontroller,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(-12),
                              border: InputBorder.none,
                              hintText: "Mobile Number",
                              hintStyle: MyText.body1(context)!
                                  .copyWith(color: MyColors.grey_40)),
                        ),
                      ),
                    ),
                    Container(width: 15),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 43,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: TextField(
                          maxLines: 1,
                          controller: _altmobilecontroller,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(-12),
                              border: InputBorder.none,
                              hintText: "Alternative Mobile",
                              hintStyle: MyText.body1(context)!
                                  .copyWith(color: MyColors.grey_40)),
                        ),
                      ),
                    )
                  ],
                ),
                Container(height: 15),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 43,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: TextField(
                          maxLines: 1,
                          controller: _regioncontroller,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(-12),
                              border: InputBorder.none,
                              hintText: "Region",
                              hintStyle: MyText.body1(context)!
                                  .copyWith(color: MyColors.grey_40)),
                        ),
                      ),
                    ),
                    Container(width: 15),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 43,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: TextField(
                          maxLines: 1,
                          controller: _citycontroller,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(-12),
                              border: InputBorder.none,
                              hintText: "City",
                              hintStyle: MyText.body1(context)!
                                  .copyWith(color: MyColors.grey_40)),
                        ),
                      ),
                    )
                  ],
                ),
                Container(height: 15),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 43,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: TextField(
                          maxLines: 1,
                          controller: _subcitycontroller,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(-12),
                              border: InputBorder.none,
                              hintText: "Sub-City",
                              hintStyle: MyText.body1(context)!
                                  .copyWith(color: MyColors.grey_40)),
                        ),
                      ),
                    ),
                    Container(width: 15),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 43,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: TextField(
                          maxLines: 1,
                          controller: _woredacontroller,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(-12),
                              border: InputBorder.none,
                              hintText: "Woreda",
                              hintStyle: MyText.body1(context)!
                                  .copyWith(color: MyColors.grey_40)),
                        ),
                      ),
                    )
                  ],
                ),
                Container(height: 15),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 43,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: TextField(
                          maxLines: 1,
                          controller: _housenumcontroller,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(-12),
                              border: InputBorder.none,
                              hintText: "House Number",
                              hintStyle: MyText.body1(context)!
                                  .copyWith(color: MyColors.grey_40)),
                        ),
                      ),
                    ),
                    Container(width: 15),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 43,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: TextField(
                          maxLines: 1,
                          controller: _officetelcontroller,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(-12),
                              border: InputBorder.none,
                              hintText: "Office Tel",
                              hintStyle: MyText.body1(context)!
                                  .copyWith(color: MyColors.grey_40)),
                        ),
                      ),
                    )
                  ],
                ),
                Container(height: 15),
                Container(
                  height: 43,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    maxLines: 1,
                    controller: _organzationcontroller,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(-12),
                        border: InputBorder.none,
                        hintText: "Organization(optional)",
                        hintStyle: MyText.body1(context)!
                            .copyWith(color: MyColors.grey_40)),
                  ),
                ),
                Container(height: 15),
                Container(
                  height: 43,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    maxLines: 1,
                    controller: _emailcontroller,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(-12),
                        border: InputBorder.none,
                        hintText: "Email or Username",
                        hintStyle: MyText.body1(context)!
                            .copyWith(color: MyColors.grey_40)),
                  ),
                ),
                Container(height: 15),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 43,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: TextField(
                          maxLines: 1,
                          controller: _passwordcontroller,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(-12),
                              border: InputBorder.none,
                              hintText: "Password",
                              hintStyle: MyText.body1(context)!
                                  .copyWith(color: MyColors.grey_40)),
                        ),
                      ),
                    ),
                    Container(width: 15),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 43,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: TextField(
                          maxLines: 1,
                          controller: _repasswordcontroller,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(-12),
                              border: InputBorder.none,
                              hintText: "reenter password ",
                              hintStyle: MyText.body1(context)!
                                  .copyWith(color: MyColors.grey_40)),
                        ),
                      ),
                    )
                  ],
                ),
                Container(height: 15),
                Container(
                  width: double.infinity,
                  height: 43,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue, elevation: 0),
                    child: Text("SUBMIT",
                        style: MyText.subhead(context)!
                            .copyWith(color: Colors.white)),
                    onPressed: () {
                      Register(context);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
