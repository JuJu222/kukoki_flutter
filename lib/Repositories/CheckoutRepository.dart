import 'dart:convert';

import 'package:kukoki_flutter/data/services/services.dart';
import 'package:kukoki_flutter/models/OrderResponse.dart';

class CheckoutRepository {
  //To call repository in PaymentViewModel
  Future<OrderResponse> getCheckoutRepository(dynamic cart) async {
    final APIServices apiServices = APIServices();
    dynamic response = await apiServices.createOrder(cart);

    return OrderResponse.fromJson(json.decode(response));
  }
}
