import 'package:flutter/cupertino.dart';
import 'package:kukoki_flutter/Models/Meal.dart';
import 'package:kukoki_flutter/Models/UserResponse.dart';
import '../Models/CheckoutResponse.dart';
import '../Repositories/UserRepository.dart';

class PlanningViewModel extends ChangeNotifier {
  List<Meal> getOrderList() {
    return UserRepository.orderList;
  }

  List<Meal> getCartList() {
    return UserRepository.cartList;
  }

  late UserResponse getUserResult;
  String getUserMessageResult = '';

  String get getUserMessage => getUserMessageResult;
  UserResponse get userResponse => getUserResult;

  // Call getUser function from the repository to be returned to the view
  Future<dynamic> getUser() async {
    try {
      final getUser = await UserRepository().getUser(1);
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
}
