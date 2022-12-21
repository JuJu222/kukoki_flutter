import 'dart:convert';

import 'package:kukoki_flutter/data/services/services.dart';
import 'package:kukoki_flutter/models/Payments.dart';

class PaymentRepository {
  Future<Payments> getPaymentRepository(dynamic amount) async {
    final ApiServices addPaymentService = ApiServices();
    dynamic response = await addPaymentService.addPayment(amount);

    return Payments.fromJson(json.decode(response));
  }

  getPayment(String amount) {}
}
