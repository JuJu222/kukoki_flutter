import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Models/Meal.dart';
import '../Models/OrderResponse.dart';
import '../Models/CheckoutResponse.dart';

class CheckoutRepository {
  // Return Midtrans' snap token in JSON to be passed on to the mobile app through existing User ID.
  Future<dynamic> checkoutAPI(String total, int userID) async {
    var response =
    await http.post(Uri.parse('https://se.kukoki.com/api/checkout'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'userID': userID,
          'total': total,
        }));

    return CheckoutResponse.fromJson(json.decode(response.body));
  }

  // Log order in database after successful payment
  Future<dynamic> createOrderAPI(List<Meal> cart, int userID) async {
    var response =
        await http.post(Uri.parse('https://se.kukoki.com/api/createOrder'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, dynamic>{
              'userID': userID,
              'cart': jsonEncode(cart),
            }));
    return OrderResponse.fromJson(json.decode(response.body));
  }
}
