import 'dart:convert';

import 'package:kukoki_flutter/Models/CheckoutResponse.dart';
import 'package:kukoki_flutter/Models/Midtrans.dart';

import '../ViewModels/OrderViewModel.dart';

class MidtransAdapter {
  late OrderViewModel orderViewModel = new OrderViewModel();

  Future<CheckoutResponse> midtranAdapterControl(String amount) async {
    CheckoutResponse getPay = await orderViewModel.checkout(amount);

    return getPay;
  }
}
