// To parse this JSON data, do
//
//     final contact = contactFromMap(jsonString);

import 'dart:convert';

Contact contactFromMap(String str) => Contact.fromMap(json.decode(str));

String contactToMap(Contact data) => json.encode(data.toMap());

class Contact {
  Contact({
    required this.contactId,
    required this.contactName,
    required this.accountName,
  });

  int contactId;
  String contactName;
  String accountName;

  factory Contact.fromMap(Map<String, dynamic> json) => Contact(
        contactId: json["ContactID"],
        contactName: json["ContactName"],
        accountName: json["AccountName"],
      );

  Map<String, dynamic> toMap() => {
        "ContactID": contactId,
        "ContactName": contactName,
        "AccountName": accountName,
      };
}
