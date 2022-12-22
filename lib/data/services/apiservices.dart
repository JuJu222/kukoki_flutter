part of "services.dart";

class APIServices {
  //Return Midtrans' snap token in JSON to be passed on to the mobile app through existing User ID.
  Future<dynamic> addPayment(String total) async {
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

  Future<dynamic> createOrder(
      List<Meal> cart,
      ) async {
    var response = await http.post(Uri.parse(Const.baseUrl + "createOrder"),
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8",
        },
        body: jsonEncode(<String, dynamic>{
          "userID": "1",
          "cart": jsonEncode(cart),
        }));

    return response.body;
  }
}
