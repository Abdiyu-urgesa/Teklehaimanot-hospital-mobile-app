import 'package:flutter/material.dart';
import '../widget/navigation_drawer.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'DoctorDetails.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DoctorsPage extends StatefulWidget {
  const DoctorsPage({super.key});

  @override
  State<DoctorsPage> createState() => _DoctorsPageState();
}

class _DoctorsPageState extends State<DoctorsPage> {
  Future<List> getDoctors() async {
    final prefs = await SharedPreferences.getInstance();
    var temp = prefs.getString('jsondocs');
// Remove data for the 'counter' key.// final success = await prefs.remove('counter');
    if (temp == null) {
      print('onlinelllllllllllllllllllllllllllllllllllllllllllllll');
      final response = await http
          .get(Uri.parse("http://192.168.100.4/lasthit/doctorGetData.php"));
      await prefs.setString('jsondocs', response.body);
      return json.decode(response.body);
    } else {
      print('ofllineeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee');
      return json.decode(temp);
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: const Text('doctors'),
          centerTitle: true,
          elevation: 0.5,
          backgroundColor: Colors.white,
          foregroundColor: Colors.blue,
        ),
        body: FutureBuilder<List>(
          future: getDoctors(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {}
            if (snapshot.hasData) {
              return Items(list: snapshot.data!);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      );
}

class Items extends StatelessWidget {
  List list;
  Items({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
          child: Card(
            child: ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.person),
                radius: 25,
              ),
              title: Text(list[i]['name_en']),
              subtitle: Text(list[i]['po_en']),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) =>
                      DoctorDetails(list: list, index: i),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}











// body: const Card(
//           child: ExpansionTile(
//             childrenPadding: EdgeInsets.symmetric(horizontal: 40),
//             leading: Icon(
//               Icons.person,
//               size: 40,
//             ),
//             title: Text(
//               'DR. Abdiyu Urgesa',
//             ),
//             subtitle: Text(
//               "internal code specialist",
//             ),
//             children: <Widget>[
//               Card(
//                 shadowColor: Colors.blue,
//                 child: ListTile(
//                   leading: Text('monday'),
//                   trailing: Text('2:00am - 5:00pm'),
//                 ),
//               ),
//             ],
//           ),
//         ),