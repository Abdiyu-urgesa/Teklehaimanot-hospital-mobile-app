import 'package:flutter/material.dart';
import '../models/Patient.dart';
import '../models/services.dart';
import '../widget/navigation_drawer.dart';

class SharePage extends StatefulWidget {
  @override
  State<SharePage> createState() => _SharePageState();
}

class _SharePageState extends State<SharePage> {
  List<Patient>? _patients;
  bool? _loading;

  @override
  void initState() {
    super.initState();
    _loading = true;
    // Services.getPatient().then((patients) {
    //   setState(() {
    //     _patients = patients;
    //     _loading = false;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: Text(_loading! ? 'Loading..' : 'patients'),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: Container(
          child: ListView.builder(
              itemCount: _patients == null ? 0 : _patients?.length,
              itemBuilder: (context, index) {
                Patient patient = _patients![index];
                return ListTile(
                  leading: Icon(Icons.person),
                  title: Text(patient.fname.toString()),
                  subtitle: Text(patient.email ?? 'email'),
                );
              }),
        ),
      );
}
