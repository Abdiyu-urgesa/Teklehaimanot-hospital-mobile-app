// To parse this JSON data, do
//
//     final schedule = scheduleFromJson(jsonString);

import 'dart:convert';

List<Schedule> scheduleFromJson(String str) =>
    List<Schedule>.from(json.decode(str).map((x) => Schedule.fromJson(x)));

String scheduleToJson(List<Schedule> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Schedule {
  Schedule({
    this.id,
    this.doctorId,
    this.workingDay,
    this.workingTime,
    this.approval,
    this.createdBy,
  });

  String? id;
  String? doctorId;
  WorkingDay? workingDay;
  String? workingTime;
  String? approval;
  String? createdBy;

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        id: json["id"],
        doctorId: json["doctor_id"],
        workingDay: workingDayValues.map[json["working_day"]],
        workingTime: json["working_time"],
        approval: json["approval"],
        createdBy: json["created_by"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "doctor_id": doctorId,
        "working_day": workingDayValues.reverse[workingDay],
        "working_time": workingTime,
        "approval": approval,
        "created_by": createdBy,
      };
}

enum WorkingDay {
  MONDAY,
  TUESDAY,
  WEDNESDAY,
  THURSDAY,
  SATURDAY,
  FRIDAY,
  SUNDAY
}

final workingDayValues = EnumValues({
  "Friday": WorkingDay.FRIDAY,
  "Monday": WorkingDay.MONDAY,
  "Saturday": WorkingDay.SATURDAY,
  "Sunday": WorkingDay.SUNDAY,
  "Thursday": WorkingDay.THURSDAY,
  "Tuesday": WorkingDay.TUESDAY,
  "Wednesday": WorkingDay.WEDNESDAY
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
