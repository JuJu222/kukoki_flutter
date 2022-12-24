import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Models/Meal.dart';
import '../Models/OrderResponse.dart';

class CheckoutRepository {
  // Log order in database after successful payment
  Future<dynamic> createOrder(List<Meal> cart) async {
    var response = await http.post(Uri.parse('https://se.kukoki.com/api/createOrder'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'userID': '1',
          'cart': jsonEncode(cart),
        }));
    return OrderResponse.fromJson(json.decode(response.body));
  }
}
