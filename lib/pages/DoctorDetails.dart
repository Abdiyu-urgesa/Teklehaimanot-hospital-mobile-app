import 'package:flutter/material.dart';

class DoctorDetails extends StatefulWidget {
  List list;
  int index;

  DoctorDetails({super.key, required this.list, required this.index});

  @override
  State<DoctorDetails> createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.list[widget.index]['name_en']}"),
      ),
      body: Center(
        child: Text("${widget.list[widget.index]['name_en']}"),
      ),
    );
  }
}
