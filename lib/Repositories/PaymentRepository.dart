import 'dart:convert';

import 'package:kukoki_flutter/data/services/services.dart';
import 'package:kukoki_flutter/models/Payments.dart';

class PaymentRepository {
  //To call repository in PaymentViewModel
  Future<Payments> getPaymentRepository(dynamic amount) async {
    final APIServices addPaymentService = APIServices();
    dynamic response = await addPaymentService.addPayment(amount);

    return Payments.fromJson(json.decode(response));
  }
}
