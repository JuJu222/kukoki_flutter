part of "services.dart";

class ApiServices {
  static Future<Payments> addPayment(
    String total,
  ) async {
    var response =
        await http.post(Uri.parse("http://10.0.2.2:8000/api/checkout"),
            headers: <String, String>{
              "Content-Type": "application/json; charset=UTF-8",
            },
            body: jsonEncode(<String, dynamic>{
              "userID": "1",
              "total": total,
            }));
    // var payment = json.decode(response.body);
    // print(payment.toString());
    return Payments.fromJson(json.decode(response.body));
  }
}
