// To parse this JSON data, do
//
//     final patient = patientFromJson(jsonString);

import 'dart:convert';

List<Patient> patientFromJson(String str) =>
    List<Patient>.from(json.decode(str).map((x) => Patient.fromJson(x)));

String patientToJson(List<Patient> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Patient {
  Patient({
    this.id,
    this.mrn,
    this.nationalId,
    this.fname,
    this.mname,
    this.lname,
    this.motherName,
    this.sex,
    this.age,
    this.birthdate,
    this.mobile,
    this.mobile1,
    this.region,
    this.subcity,
    this.houseNo,
    this.officeTel,
    this.organization,
    this.city,
    this.wereda,
    this.email,
    this.cardStatus,
    this.createdBy,
    this.updateBy,
  });

  String? id;
  String? mrn;
  String? nationalId;
  Fname? fname;
  Name? mname;
  Name? lname;
  MotherName? motherName;
  Sex? sex;
  String? age;
  String? birthdate;
  String? mobile;
  Mobile1? mobile1;
  City? region;
  Subcity? subcity;
  String? houseNo;
  OfficeTel? officeTel;
  Organization? organization;
  City? city;
  Wereda? wereda;
  String? email;
  String? cardStatus;

  String? createdBy;
  String? updateBy;

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
        id: json["id"],
        mrn: json["mrn"],
        nationalId: json["national_id"],
        fname: fnameValues.map[json["fname"]],
        mname: nameValues.map[json["mname"]],
        lname: nameValues.map[json["lname"]],
        motherName: motherNameValues.map[json["mother_name"]],
        sex: sexValues.map[json["sex"]],
        age: json["age"],
        birthdate: json["birthdate"],
        mobile: json["mobile"],
        mobile1: mobile1Values.map[json["mobile1"]],
        region: cityValues.map[json["region"]],
        subcity: subcityValues.map[json["subcity"]],
        houseNo: json["house_no"],
        officeTel: officeTelValues.map[json["office_tel"]],
        organization: organizationValues.map[json["organization"]],
        city: cityValues.map[json["city"]],
        wereda: weredaValues.map[json["wereda"]],
        email: json["email"],
        cardStatus: json["card_status"],
        createdBy: json["created_by"],
        updateBy: json["update_by"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "mrn": mrn,
        "national_id": nationalId,
        "fname": fnameValues.reverse[fname],
        "mname": nameValues.reverse[mname],
        "lname": nameValues.reverse[lname],
        "mother_name": motherNameValues.reverse[motherName],
        "sex": sexValues.reverse[sex],
        "age": age,
        "birthdate": birthdate,
        "mobile": mobile,
        "mobile1": mobile1Values.reverse[mobile1],
        "region": cityValues.reverse[region],
        "subcity": subcityValues.reverse[subcity],
        "house_no": houseNo,
        "office_tel": officeTelValues.reverse[officeTel],
        "organization": organizationValues.reverse[organization],
        "city": cityValues.reverse[city],
        "wereda": weredaValues.reverse[wereda],
        "email": email,
        "card_status": cardStatus,
        "created_by": createdBy,
        "update_by": updateBy,
      };
}

enum City { EMPTY, ADDIS_ABABA }

final cityValues =
    EnumValues({"Addis Ababa": City.ADDIS_ABABA, "": City.EMPTY});

enum Fname { EMPTY, MELKAMU }

final fnameValues = EnumValues({"": Fname.EMPTY, "Melkamu": Fname.MELKAMU});

enum Name { EMPTY, MITIKU }

final nameValues = EnumValues({"": Name.EMPTY, "Mitiku": Name.MITIKU});

enum Mobile1 { EMPTY, THE_987645485454 }

final mobile1Values = EnumValues(
    {"": Mobile1.EMPTY, "+987-64548-5454": Mobile1.THE_987645485454});

enum MotherName { EMPTY, ADELAHU }

final motherNameValues =
    EnumValues({"Adelahu": MotherName.ADELAHU, "": MotherName.EMPTY});

enum OfficeTel { EMPTY, THE_251899996969 }

final officeTelValues = EnumValues(
    {"": OfficeTel.EMPTY, "+251-89999-6969": OfficeTel.THE_251899996969});

enum Organization { EMPTY, MELFAN }

final organizationValues =
    EnumValues({"": Organization.EMPTY, "Melfan": Organization.MELFAN});

enum Sex { EMPTY, MALE }

final sexValues = EnumValues({"": Sex.EMPTY, "Male": Sex.MALE});

enum Subcity { EMPTY, OTHER }

final subcityValues = EnumValues({"": Subcity.EMPTY, "Other": Subcity.OTHER});

enum Wereda { EMPTY, THE_09 }

final weredaValues = EnumValues({"": Wereda.EMPTY, "09": Wereda.THE_09});

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
