import 'package:flutter/cupertino.dart';
import 'package:kukoki_flutter/Models/CheckoutResponse.dart';
import 'package:kukoki_flutter/Repositories/CheckoutRepository.dart';

class MidtransAdapter extends ChangeNotifier {
  late CheckoutResponse checkoutResult;

  CheckoutResponse get checkoutResponse => checkoutResult;

  // Call checkout function from the repository to be returned to the view
  Future<CheckoutResponse> checkout(String total, int userID) async {
    try {
      final checkout = await CheckoutRepository().checkoutAPI(total, userID);
      if (checkout.snapUrl == null) {
        notifyListeners();
        checkout.status = 'failed';
        return checkoutResult = checkout;
      } else {
        notifyListeners();
        return checkoutResult = checkout;
      }
    } catch (e) {
      notifyListeners();
      final checkout = CheckoutResponse();
      checkout.status = 'failed';
      return checkoutResult = checkout;
    }
  }
}
