import 'package:flutter/cupertino.dart';
import 'package:kukoki_flutter/Models/Meal.dart';
import 'package:kukoki_flutter/Models/UserResponse.dart';
import '../Models/CheckoutResponse.dart';
import '../Repositories/OrderRepository.dart';

class OrderViewModel extends ChangeNotifier {
  List<Meal> getOrderList() {
    return OrderRepository.orderList;
  }

  List<Meal> getCartList() {
    return OrderRepository.cartList;
  }

  late UserResponse getUserResult;
  String getUserMessageResult = '';

  String get getUserMessage => getUserMessageResult;
  UserResponse get userResponse => getUserResult;

  // Call getUser function from the repository to be returned to the view
  Future<dynamic> getUser() async {
    try {
      final getUser = await OrderRepository().getUser(1);
      if (getUser.status == null) {
        notifyListeners();
        return getUserMessageResult = 'empty data';
      } else {
        notifyListeners();
        return getUserResult = getUser;
      }
    } catch (e) {
      notifyListeners();
      return getUserMessageResult = 'ERROR --> $e';
    }
  }

  late CheckoutResponse checkoutResult;
  String checkoutMessageResult = '';

  String get checkoutMessage => checkoutMessageResult;
  CheckoutResponse get checkoutResponse => checkoutResult;

  // Call checkout function from the repository to be returned to the view
  Future<dynamic> checkout(String total) async {
    try {
      final checkout = await OrderRepository().checkout(total);
      if (checkout.snapUrl == null) {
        notifyListeners();
        return checkoutMessageResult = 'empty data';
      } else {
        notifyListeners();
        return checkoutResult = checkout;
      }
    } catch (e) {
      notifyListeners();
      return checkoutMessageResult = 'ERROR --> $e';
    }
  }
}
