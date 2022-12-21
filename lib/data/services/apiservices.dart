part of "services.dart";

// class ApiServices {
//   // calling api from backend that contain payment gateaway url links
//   static Future<Payments> addPayment(
//     String total,
//   ) async {
//     var response = await http.post(Uri.parse(Const.baseUrl + "checkout"),
//         headers: <String, String>{
//           "Content-Type": "application/json; charset=UTF-8",
//         },
//         body: jsonEncode(<String, dynamic>{
//           "userID": "1",
//           "total": total,
//         }));
//     print(response.body);
//     return Payments.fromJson(json.decode(response.body));
//   }
// }

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
