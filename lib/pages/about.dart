import 'package:flutter/material.dart';
import '../data/img.dart';
import '../data/my_colors.dart';
import '../widget/my_text.dart';
import '../widget/navigation_drawer.dart';

class AboutCompanyImageRoute extends StatefulWidget {
  const AboutCompanyImageRoute();

  @override
  AboutCompanyImageRouteState createState() => AboutCompanyImageRouteState();
}

class AboutCompanyImageRouteState extends State<AboutCompanyImageRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text('about'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 250,
              child: Stack(
                children: <Widget>[
                  Image.asset(Img.get('tk_home.jpg'),
                      height: double.infinity,
                      width: double.infinity,
                      fit: BoxFit.cover),
                  Container(
                      height: double.infinity,
                      width: double.infinity,
                      color: Colors.black.withOpacity(0.5)),
                  Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 20),
                                elevation: 0),
                            child: const Text(
                              "CONTACT US",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {},
                          ),
                          Container(
                            width: 220,
                            child: Text("22 Year in Service",
                                textAlign: TextAlign.center,
                                style: MyText.title(context)!.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500)),
                          )
                        ],
                      )),
                ],
              ),
            ),
            Container(height: 25),
            Text("Mission",
                style: MyText.medium(context).copyWith(
                    color: MyColors.primary, fontWeight: FontWeight.w500)),
            Container(height: 15),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                  'To provide quality health care services with reasonable price.',
                  textAlign: TextAlign.center,
                  style: MyText.body2(context)!.copyWith(
                    color: MyColors.grey_60,
                    fontWeight: FontWeight.w300,
                  )),
            ),
            Container(height: 25),
            Text("Address",
                style: MyText.medium(context).copyWith(
                    color: MyColors.primary, fontWeight: FontWeight.w500)),
            Container(height: 15),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.asset(Img.get('image_maps.jpg'),
                      height: 150, width: double.infinity, fit: BoxFit.cover),
                  Container(height: 15),
                  Text(
                      "SomaleTera, Infront of Global Insurance Addis Ababa, Ethiopia",
                      style: MyText.subhead(context)!
                          .copyWith(color: MyColors.grey_60)),
                ],
              ),
            ),
            Container(height: 15),
          ],
        ),
      ),
    );
  }
}
