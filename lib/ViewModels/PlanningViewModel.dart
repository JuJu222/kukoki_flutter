import 'package:flutter/cupertino.dart';
import 'package:kukoki_flutter/Models/Meal.dart';
import 'package:kukoki_flutter/Models/UserResponse.dart';
import '../Models/CheckoutResponse.dart';
import '../Repositories/UserRepository.dart';

class PlanningViewModel extends ChangeNotifier {
  late UserResponse getUserResult;
  String getUserMessageResult = '';

  List<Meal> getCartList() {
    return UserRepository.cartList;
  }

  // Call getUser function from the repository to be returned to the view
  Future<dynamic> getUser(int userID) async {
    try {
      final getUser = await UserRepository().getUserAPI(userID);
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
