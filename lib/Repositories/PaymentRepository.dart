import 'dart:convert';

import 'package:kukoki_flutter/data/services/services.dart';
import 'package:kukoki_flutter/models/Payments.dart';

class PaymentRepository {
  //To call repository in PaymentViewModel
  Future<Payments> getPaymentRepository(dynamic amount) async {
    final APIServices apiServices = APIServices();
    dynamic response = await apiServices.addPayment(amount);

    return Payments.fromJson(json.decode(response));
  }
}
