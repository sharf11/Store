// To parse this JSON data, do
//
//     final suppliers = suppliersFromJson(jsonString);

import 'dart:convert';

Suppliers suppliersFromJson(String str) => Suppliers.fromJson(json.decode(str));

String suppliersToJson(Suppliers data) => json.encode(data.toJson());

class Suppliers {
  Suppliers({
    this.statusCode,
    this.suppliersItem,
    this.messageCode,
  });

  int statusCode;
  List<SuppliersItem> suppliersItem;
  String messageCode;

  factory Suppliers.fromJson(Map<String, dynamic> json) => Suppliers(
    statusCode: json["StatusCode"] == null ? null : json["StatusCode"],
    suppliersItem: json["SuppliersItem"] == null ? null : List<SuppliersItem>.from(json["SuppliersItem"].map((x) => SuppliersItem.fromJson(x))),
    messageCode: json["MessageCode"] == null ? null : json["MessageCode"],
  );

  Map<String, dynamic> toJson() => {
    "StatusCode": statusCode == null ? null : statusCode,
    "SuppliersItem": suppliersItem == null ? null : List<dynamic>.from(suppliersItem.map((x) => x.toJson())),
    "MessageCode": messageCode == null ? null : messageCode,
  };
}

class SuppliersItem {
  SuppliersItem({
    this.supplierId,
    this.code,
    this.name,
    this.phone,
    this.mobile,
    this.address,
    this.beginningBalance,
    this.balanceType,
    this.contactPerson,
    this.contactMobile,
    this.notes,
    this.isActive,
    this.insertUser,
    this.insertDate,
    this.updateUser,
    this.updateDate,
  });

  int supplierId;
  int code;
  String name;
  String phone;
  String mobile;
  String address;
  int beginningBalance;
  String balanceType;
  String contactPerson;
  String contactMobile;
  String notes;
  int isActive;
  int insertUser;
  Date insertDate;
  int updateUser;
  Date updateDate;

  factory SuppliersItem.fromJson(Map<String, dynamic> json) => SuppliersItem(
    supplierId: json["SupplierID"] == null ? null : json["SupplierID"],
    code: json["Code"] == null ? null : json["Code"],
    name: json["Name"] == null ? null : json["Name"],
    phone: json["Phone"] == null ? null : json["Phone"],
    mobile: json["Mobile"] == null ? null : json["Mobile"],
    address: json["Address"] == null ? null : json["Address"],
    beginningBalance: json["BeginningBalance"] == null ? null : json["BeginningBalance"],
    balanceType: json["BalanceType"] == null ? null : json["BalanceType"],
    contactPerson: json["ContactPerson"] == null ? null : json["ContactPerson"],
    contactMobile: json["ContactMobile"] == null ? null : json["ContactMobile"],
    notes: json["Notes"] == null ? null : json["Notes"],
    isActive: json["IsActive"] == null ? null : json["IsActive"],
    insertUser: json["InsertUser"] == null ? null : json["InsertUser"],
    insertDate: json["InsertDate"] == null ? null : Date.fromJson(json["InsertDate"]),
    updateUser: json["UpdateUser"] == null ? null : json["UpdateUser"],
    updateDate: json["UpdateDate"] == null ? null : Date.fromJson(json["UpdateDate"]),
  );

  Map<String, dynamic> toJson() => {
    "SupplierID": supplierId == null ? null : supplierId,
    "Code": code == null ? null : code,
    "Name": name == null ? null : name,
    "Phone": phone == null ? null : phone,
    "Mobile": mobile == null ? null : mobile,
    "Address": address == null ? null : address,
    "BeginningBalance": beginningBalance == null ? null : beginningBalance,
    "BalanceType": balanceType == null ? null : balanceType,
    "ContactPerson": contactPerson == null ? null : contactPerson,
    "ContactMobile": contactMobile == null ? null : contactMobile,
    "Notes": notes == null ? null : notes,
    "IsActive": isActive == null ? null : isActive,
    "InsertUser": insertUser == null ? null : insertUser,
    "InsertDate": insertDate == null ? null : insertDate.toJson(),
    "UpdateUser": updateUser == null ? null : updateUser,
    "UpdateDate": updateDate == null ? null : updateDate.toJson(),
  };
}

class Date {
  Date({
    this.date,
    this.timezoneType,
    this.timezone,
  });

  DateTime date;
  int timezoneType;
  Timezone timezone;

  factory Date.fromJson(Map<String, dynamic> json) => Date(
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    timezoneType: json["timezone_type"] == null ? null : json["timezone_type"],
    timezone: json["timezone"] == null ? null : timezoneValues.map[json["timezone"]],
  );

  Map<String, dynamic> toJson() => {
    "date": date == null ? null : date.toIso8601String(),
    "timezone_type": timezoneType == null ? null : timezoneType,
    "timezone": timezone == null ? null : timezoneValues.reverse[timezone],
  };
}

enum Timezone { EUROPE_MINSK }

final timezoneValues = EnumValues({
  "Europe/Minsk": Timezone.EUROPE_MINSK
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}