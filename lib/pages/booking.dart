import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:testing1212/models/Booking.dart';
import '../models/services.dart';
import '../widget/navigation_drawer.dart';
import 'package:http/http.dart' as http;

class BookingPage extends StatefulWidget {
  final String patientId;
  const BookingPage({Key? key, required this.patientId}) : super(key: key);

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  List<Booking>? _bookings;
  bool? _loading;
  var doc;
  @override
  void initState() {
    super.initState();
    _loading = true;
    Services.getbooking(widget.patientId).then((bookings) {
      setState(() {
        // Iterable<Booking> filtbookings = bookings.where((book) {
        //   return book.patientId ==
        //       '33'; //give the pattient id which is sent from login page or local data that is saved
        // });
        // _bookings = filtbookings.toList();
        getDoctors();
        _bookings = bookings;
        _loading = false;
      });
    });
  }

  Future<List> getDoctors() async {
    final response = await http
        .get(Uri.parse("http://192.168.100.4/lasthit/doctorGetData.php"));
    var doctors = json.decode(response.body);
    return doc = doctors;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
            title: Text(_loading! ? 'Loading..' : 'Bookings'),
            centerTitle: true,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {},
              ),
            ]),
        body: ListView.builder(
            itemCount: _bookings == null ? 0 : _bookings?.length,
            itemBuilder: (context, index) {
              Booking booking = _bookings![index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Card(
                  color: const Color.fromARGB(255, 218, 225, 230),
                  child: ExpansionTile(
                    leading: const Icon(Icons.calendar_month),
                    title: Text(booking.selectedDay.toString()),
                    subtitle:
                        Text(booking.status != 1 ? 'pending' : 'doctorid'),
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: ListTile(
                          leading: const Icon(Icons.lock_clock),
                          title: const Text('Time'),
                          trailing: Text(booking.selectedTime.toString()),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: ListTile(
                          leading: const Icon(Icons.person),
                          title: const Text('Doctor'),
                          trailing: Text(booking.doctorId.toString()),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: ListTile(
                          leading: const Icon(Icons.date_range),
                          title: const Text('Date'),
                          trailing: Text(booking.selectedDate.toString()),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      );
}
