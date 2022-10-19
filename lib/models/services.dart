import 'package:http/http.dart' as http;
import 'package:testing1212/models/Booking.dart';
import 'package:testing1212/models/Schedule.dart';
import 'package:testing1212/models/User.dart';
import 'Patient.dart';

class Services {
  static const String patienturl =
      "http://192.168.100.4/lasthit/patientGetData.php";
  static Future<List<Patient>> getPatient() async {
    try {
      final response = await http.get(Uri.parse(patienturl));
      if (response.statusCode == 200) {
        final List<Patient> patients = patientFromJson(response.body);
        return patients;
      } else {
        return <Patient>[];
      }
    } catch (e) {
      return <Patient>[];
    }
  }

  static const String scheduleurl =
      "http://192.168.190.137/lasthit/scheduleGetData.php";
  static Future<List<Schedule>> getschedule() async {
    try {
      final response = await http.get(Uri.parse(scheduleurl));
      if (response.statusCode == 200) {
        final List<Schedule> schedules = scheduleFromJson(response.body);
        return schedules;
      } else {
        return <Schedule>[];
      }
    } catch (e) {
      return <Schedule>[];
    }
  }

  static const String bookingurl =
      "http://192.168.100.4/lasthit/bookingGetData.php";
  static Future<List<Booking>> getbooking(String patientid) async {
    try {
      final response = await http.post(Uri.parse(bookingurl), body: {
        "patient_id": patientid
      }); //add parameter using comma inside curly braces
      if (response.statusCode == 200) {
        final List<Booking> bookings = bookingFromJson(response.body);
        return bookings;
      } else {
        return <Booking>[];
      }
    } catch (e) {
      return <Booking>[];
    }
  }

  static const String userurl =
      "http://192.168.100.4/lasthit/bookingGetData.php";
  static Future<List<User>> getuser() async {
    try {
      final response = await http.get(Uri.parse(userurl));
      if (response.statusCode == 200) {
        final List<User> users = userFromJson(response.body);
        return users;
      } else {
        return <User>[];
      }
    } catch (e) {
      return <User>[];
    }
  }
}
