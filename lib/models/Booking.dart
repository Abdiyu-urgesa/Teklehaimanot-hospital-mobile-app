// To parse this JSON data, do
//
//     final booking = bookingFromJson(jsonString);

import 'dart:convert';

List<Booking> bookingFromJson(String str) =>
    List<Booking>.from(json.decode(str).map((x) => Booking.fromJson(x)));

String bookingToJson(List<Booking> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Booking {
  Booking({
    this.id,
    this.patientId,
    this.doctorId,
    this.selectedDay,
    this.selectedTime,
    this.selectedDate,
    this.orderId,
    this.bankName,
    this.account,
    this.trsId,
    this.amount,
    this.status,
    this.createdBy,
    this.createdAt,
  });

  String? id;
  String? patientId;
  String? doctorId;
  SelectedDay? selectedDay;
  String? selectedTime;
  DateTime? selectedDate;
  String? orderId;
  BankName? bankName;
  Account? account;
  String? trsId;
  String? amount;
  String? status;
  String? createdBy;
  DateTime? createdAt;

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
        id: json["id"],
        patientId: json["patient_id"],
        doctorId: json["doctor_id"],
        selectedDay: selectedDayValues.map[json["selected_day"]],
        selectedTime: json["selected_time"],
        selectedDate: DateTime.parse(json["selected_date"]),
        orderId: json["order_id"],
        bankName: bankNameValues.map[json["bank_name"]],
        account: accountValues.map[json["account"]],
        trsId: json["trs_id"],
        amount: json["amount"],
        status: json["status"],
        createdBy: json["created_by"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "patient_id": patientId,
        "doctor_id": doctorId,
        "selected_day": selectedDayValues.reverse[selectedDay],
        "selected_time": selectedTime,
        "selected_date":
            "${selectedDate!.year.toString().padLeft(4, '0')}-${selectedDate!.month.toString().padLeft(2, '0')}-${selectedDate!.day.toString().padLeft(2, '0')}",
        "order_id": orderId,
        "bank_name": bankNameValues.reverse[bankName],
        "account": accountValues.reverse[account],
        "trs_id": trsId,
        "amount": amount,
        "status": status,
        "created_by": createdBy,
        "created_at": createdAt!.toIso8601String(),
      };
}

enum Account { EMPTY, THE_251911235528, THE_251944309559, THE_5700021317074472 }

final accountValues = EnumValues({
  "": Account.EMPTY,
  "251911235528": Account.THE_251911235528,
  "251944309559": Account.THE_251944309559,
  "5700021317074472": Account.THE_5700021317074472
});

enum BankName { EMPTY, AMOLE }

final bankNameValues =
    EnumValues({"Amole": BankName.AMOLE, "": BankName.EMPTY});

enum SelectedDay { TUESDAY, SUNDAY, THURSDAY, MONDAY, FRIDAY, SATURDAY }

final selectedDayValues = EnumValues({
  "Friday": SelectedDay.FRIDAY,
  "Monday": SelectedDay.MONDAY,
  "Saturday": SelectedDay.SATURDAY,
  "Sunday": SelectedDay.SUNDAY,
  "Thursday": SelectedDay.THURSDAY,
  "Tuesday": SelectedDay.TUESDAY
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
