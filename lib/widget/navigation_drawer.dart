import 'package:flutter/material.dart';
import '/widget/my_text.dart';
import '/data/img.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 190,
              child: Stack(
                children: <Widget>[
                  Image.asset(
                    Img.get('tk_home.jpg'),
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text("Home",
                  style: MyText.subhead(context)!.copyWith(
                      color: Colors.black, fontWeight: FontWeight.w500)),
              leading: const Icon(Icons.home, size: 25.0, color: Colors.blue),
              onTap: () {
                selectedItem(context, 'home');
              },
            ),
            ListTile(
              title: Text("Appointment",
                  style: MyText.subhead(context)!.copyWith(
                      color: Colors.black, fontWeight: FontWeight.w500)),
              leading:
                  const Icon(Icons.more_time, size: 25.0, color: Colors.blue),
              onTap: () {
                selectedItem(context, 'appointment');
              },
            ),
            ListTile(
              title: Text("Deparments",
                  style: MyText.subhead(context)!.copyWith(
                      color: Colors.black, fontWeight: FontWeight.w500)),
              leading:
                  const Icon(Icons.category, size: 25.0, color: Colors.blue),
              onTap: () {
                selectedItem(context, 'departments');
              },
            ),
            ListTile(
              title: Text("Doctors",
                  style: MyText.subhead(context)!.copyWith(
                      color: Colors.black, fontWeight: FontWeight.w500)),
              leading: const Icon(Icons.monitor_heart,
                  size: 25.0, color: Colors.blue),
              onTap: () {
                selectedItem(context, 'doctors');
              },
            ),
            const Padding(
              padding: EdgeInsets.only(right: 100),
              child: Divider(),
            ),
            ListTile(
              title: Text("Timetable",
                  style: MyText.subhead(context)!.copyWith(
                      color: Colors.black, fontWeight: FontWeight.w500)),
              leading: const Icon(Icons.calendar_month_rounded,
                  size: 25.0, color: Colors.blue),
              onTap: () {
                selectedItem(context, 'timetable');
              },
            ),
            ListTile(
              title: Text("Events",
                  style: MyText.subhead(context)!.copyWith(
                      color: Colors.black, fontWeight: FontWeight.w500)),
              leading: const Icon(Icons.event_available,
                  size: 25.0, color: Colors.blue),
              onTap: () {
                selectedItem(context, 'events');
              },
            ),
            const Padding(
              padding: EdgeInsets.only(right: 100),
              child: Divider(),
            ),
            ListTile(
              title: Text("About",
                  style: MyText.subhead(context)!.copyWith(
                      color: Colors.black, fontWeight: FontWeight.w500)),
              leading: const Icon(Icons.info, size: 25.0, color: Colors.blue),
              onTap: () {
                selectedItem(context, 'about');
              },
            ),
            // ListTile(
            //   title: Text("Share",
            //       style: MyText.subhead(context)!.copyWith(
            //           color: Colors.black, fontWeight: FontWeight.w500)),
            //   leading: const Icon(Icons.share, size: 25.0, color: Colors.blue),
            //   onTap: () {
            //     selectedItem(context, 'share');
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}

void selectedItem(BuildContext context, String index) {
  Navigator.of(context).pop();

  switch (index) {
    case 'home':
      Navigator.of(context).pushNamed('/');
      break;
    case 'appointment':
      Navigator.of(context).pushNamed('/appointment');
      break;
    case 'about':
      Navigator.of(context).pushNamed('/about');
      break;

    case 'departments':
      Navigator.of(context).pushNamed('/department');
      break;
    case 'doctors':
      Navigator.of(context).pushNamed('/doctors');
      break;
    case 'timetable':
      Navigator.of(context).pushNamed('/timetable');
      break;
    case 'events':
      Navigator.of(context).pushNamed('/events');
      break;
    case 'share':
      Navigator.of(context).pushNamed('/share');
      break;
  }
}
