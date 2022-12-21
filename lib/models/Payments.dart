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

  factory Payments.fromJson(Map<String, dynamic> json) => Payments(
        snapToken: json["snapToken"],
        snapUrl: json["snapURL"],
      );

  Map<String, dynamic> toJson() => {
        "snapToken": snapToken,
        "snapURL": snapUrl,
      };
}
