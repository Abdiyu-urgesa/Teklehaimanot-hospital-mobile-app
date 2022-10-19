import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../widget/navigation_drawer.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class DepartmentPage extends StatefulWidget {
  @override
  State<DepartmentPage> createState() => _DepartmentPageState();
}

class _DepartmentPageState extends State<DepartmentPage> {
  Future<List> getDepartments() async {
    final prefs = await SharedPreferences.getInstance();
    // final success = await prefs.remove('jsondepartment');
    var temp = prefs.getString('jsondepartment');
// Remove data for the 'counter' key.// final success = await prefs.remove('counter');
    if (temp == null) {
      print('onlinelllllllllllllllllllllllllllllllllllllllllllllll');
      final response = await http
          .get(Uri.parse("http://192.168.100.4/lasthit/departmentGetData.php"));
      await prefs.setString('jsondepartment', response.body);
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
          title: const Text('Department'),
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.grey[900],
        ),
        body: FutureBuilder<List>(
          future: getDepartments(),
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
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 230,
        childAspectRatio: 1,
        crossAxisSpacing: 0,
        mainAxisSpacing: 10,
      ),
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
          child: Card(
            child: Column(
              children: [
                Expanded(
                  child: CachedNetworkImage(
                    key: UniqueKey(),
                    imageUrl:
                        'http://www.teklehaimanothospital.com/admin/${list[i]['icon']}',
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                Container(height: 10),
                Text(list[i]['title_en']),
                Container(height: 10),
              ],
            ),
          ),
        );
      },
    );
  }
}
