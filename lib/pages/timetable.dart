import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:testing1212/models/services.dart';
import '../widget/navigation_drawer.dart';

class TimetablePage extends StatefulWidget {
  const TimetablePage({super.key});

  @override
  State<TimetablePage> createState() => _TimetablePageState();
}

class _TimetablePageState extends State<TimetablePage> {
  Future fetchSchedule() async {
    var _schedules = Services.getschedule();
    return _schedules;
  }

  List results = [];
  DataRow _getDataRow(index, data) {
    return DataRow(
      cells: <DataCell>[
        DataCell(Text(data.doctorId)),
        DataCell(Text(data.workingTime)),
        DataCell(Text(data.workingTime)),
        DataCell(Text(data.workingTime)),
        DataCell(Text(data.workingTime)),
        DataCell(Text(data.workingTime)),
        DataCell(Text(data.workingTime)),
        DataCell(Text(data.workingTime)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: const Text('timetable'),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: FutureBuilder(
            future: fetchSchedule(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                results = snapshot.data;
                if (snapshot.data.length != 0) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                    ),
                    child: DataTable(
                      columnSpacing: 30,
                      columns: [
                        DataColumn(label: Text('doctor')),
                        DataColumn(label: Text('Mon')),
                        DataColumn(label: Text('Thue')),
                        DataColumn(label: Text('Wed')),
                        DataColumn(label: Text('Thur')),
                        DataColumn(label: Text('Fri')),
                        DataColumn(label: Text('Sat')),
                        DataColumn(label: Text('Sun')),
                      ],
                      rows: List.generate(
                        results.length,
                        (index) => _getDataRow(
                          index,
                          results[index],
                        ),
                      ),
                      showBottomBorder: true,
                    ),
                  );
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      SizedBox(
                        // ignore: sort_child_properties_last
                        child: CircularProgressIndicator(),
                        width: 30,
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Text('No Data Found...'),
                      ),
                    ],
                  );
                }
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    SizedBox(
                      // ignore: sort_child_properties_last
                      child: CircularProgressIndicator(),
                      width: 30,
                      height: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Text('No Data ...'),
                    ),
                  ],
                );
              }
            },
          ),
        ),
      );
}
