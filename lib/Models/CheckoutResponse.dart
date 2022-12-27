import 'dart:convert';

CheckoutResponse checkoutResponseFromJson(String str) => CheckoutResponse.fromJson(json.decode(str));

String checkoutResponseToJson(CheckoutResponse data) => json.encode(data.toJson());

class CheckoutResponse {
  CheckoutResponse({
    this.status,
    this.snapUrl,
  });

  String? status;
  String? snapUrl;

  // Convert JSON to CheckoutResponse object
  factory CheckoutResponse.fromJson(Map<String, dynamic> json) => CheckoutResponse(
        status: json['status'],
        snapUrl: json['snapURL'],
      );

  // Convert CheckoutResponse object to JSON
  Map<String, dynamic> toJson() => {
        'status': status,
        'snapURL': snapUrl,
      };
}
