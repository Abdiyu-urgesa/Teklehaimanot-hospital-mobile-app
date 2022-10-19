import 'package:flutter/material.dart';
import 'package:testing1212/pages/share.dart';
import '../data/my_colors.dart';
import '../widget/my_text.dart';
import '/data/img.dart';
import 'doctors.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: 200,
                    width: double.infinity,
                    child: Image.asset(
                      Img.get('tk_home.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    color: Colors.black.withOpacity(0.4),
                    height: 200,
                    width: double.infinity,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Teklehaimanot General\n Hospital",
                          textAlign: TextAlign.center,
                          style: MyText.medium(context).copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // ignore: prefer_const_constructors

                    Container(height: 25),
                    Text("SERVICES",
                        style: MyText.medium(context).copyWith(
                            color: MyColors.primary,
                            fontWeight: FontWeight.w500)),
                    Container(height: 15),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                          'Patient-centered private hospital in the center of Addis Ababa that provides trusted multi-disciplinary medical services to patients. With a focus on quality and customer care',
                          textAlign: TextAlign.center,
                          style: MyText.body2(context)!.copyWith(
                            color: MyColors.grey_60,
                            fontWeight: FontWeight.w300,
                          )),
                    ),
                    Container(height: 15),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed('/appointment');
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            color: Colors.white,
                            elevation: 2,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Container(
                              height: 120,
                              width: 150,
                              alignment: Alignment.center,
                              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    child: Icon(Icons.more_time,
                                        size: 40, color: Colors.yellow[900]),
                                  ),
                                  Text('Appointment',
                                      textAlign: TextAlign.center,
                                      style: MyText.subhead(context)!
                                          .copyWith(color: Colors.grey[800])),
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed('/department');
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            color: Colors.white,
                            elevation: 2,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Container(
                              height: 120,
                              width: 150,
                              alignment: Alignment.center,
                              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    child: Icon(Icons.people,
                                        size: 40, color: Colors.pink[600]),
                                  ),
                                  Text('Departments',
                                      textAlign: TextAlign.center,
                                      style: MyText.subhead(context)!
                                          .copyWith(color: Colors.grey[800])),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DoctorsPage(),
                            ));
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            color: Colors.white,
                            elevation: 2,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Container(
                              height: 120,
                              width: 150,
                              alignment: Alignment.center,
                              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    child: Icon(Icons.medical_services,
                                        size: 40, color: Colors.red[600]),
                                  ),
                                  Text('Doctors',
                                      textAlign: TextAlign.center,
                                      style: MyText.subhead(context)!
                                          .copyWith(color: Colors.grey[800])),
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SharePage(),
                            ));
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            color: Colors.white,
                            elevation: 2,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Container(
                              height: 120,
                              width: 150,
                              alignment: Alignment.center,
                              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    child: Icon(Icons.contact_phone,
                                        size: 40, color: Colors.green[600]),
                                  ),
                                  Text('Contact',
                                      textAlign: TextAlign.center,
                                      style: MyText.subhead(context)!
                                          .copyWith(color: Colors.grey[800])),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
