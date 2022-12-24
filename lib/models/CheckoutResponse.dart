import 'dart:convert';

CheckoutResponse checkoutResponseFromJson(String str) => CheckoutResponse.fromJson(json.decode(str));

String checkoutResponseToJson(CheckoutResponse data) => json.encode(data.toJson());

class CheckoutResponse {
  CheckoutResponse({
    this.snapToken,
    this.snapUrl,
  });

  String? snapToken;
  String? snapUrl;

  // Convert JSON to CheckoutResponse object
  factory CheckoutResponse.fromJson(Map<String, dynamic> json) => CheckoutResponse(
        snapToken: json['snapToken'],
        snapUrl: json['snapURL'],
      );

  // Convert CheckoutResponse object to JSON
  Map<String, dynamic> toJson() => {
        'snapToken': snapToken,
        'snapURL': snapUrl,
      };
}
