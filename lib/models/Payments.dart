// To parse this JSON data, do
//
//     final payments = paymentsFromJson(jsonString);

import 'dart:convert';

Payments paymentsFromJson(String str) => Payments.fromJson(json.decode(str));

String paymentsToJson(Payments data) => json.encode(data.toJson());

class Payments {
  Payments({
    this.snapToken,
    this.snapUrl,
  });

  String? snapToken;
  String? snapUrl;

  //Initiate a map where snapToken and snapURL from JSON is both keys with String or Dynamic values.
  factory Payments.fromJson(Map<String, dynamic> json) => Payments(
        snapToken: json["snapToken"],
        snapUrl: json["snapURL"],
      );

  //Invert map to JSON.
  Map<String, dynamic> toJson() => {
        "snapToken": snapToken,
        "snapURL": snapUrl,
      };
}
