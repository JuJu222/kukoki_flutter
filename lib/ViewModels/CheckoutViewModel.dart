import 'package:flutter/cupertino.dart';
import '../Models/Meal.dart';
import '../Models/OrderResponse.dart';
import '../Repositories/CheckoutRepository.dart';
import '../Repositories/UserRepository.dart';

class CheckoutViewModel extends ChangeNotifier {

  void emptyCart() {
    UserRepository.cartList = [];
  }

  late OrderResponse createOrderResult;
  String messageResult = '';

  String get message => messageResult;
  OrderResponse get result => createOrderResult;

  // Call createOrder function from the repository to be returned to the view
  Future<dynamic> createOrder(List<Meal> cart, int userID) async {
    try {
      final createOrder = await CheckoutRepository().createOrderAPI(cart, userID);
      if (createOrder.status == null) {
        notifyListeners();
        return messageResult = 'empty data';
      } else {
        notifyListeners();
        return createOrderResult = createOrder;
      }
    } catch (e) {
      notifyListeners();
      return messageResult = 'ERROR --> $e';
    }
  }
}
