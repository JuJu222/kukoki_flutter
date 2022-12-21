part of "services.dart";

class ApiServices {
  Future<dynamic> addPayment(
    String total,
  ) async {
    var response = await http.post(Uri.parse(Const.baseUrl + "checkout"),
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8",
        },
        body: jsonEncode(<String, dynamic>{
          "userID": "1",
          "total": total,
        }));

    return response.body;
  }
}
