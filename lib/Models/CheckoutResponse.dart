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
}
