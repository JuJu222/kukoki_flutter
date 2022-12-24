import 'package:flutter/cupertino.dart';
import '../Models/Meal.dart';
import '../Models/OrderResponse.dart';
import '../Repositories/CheckoutRepository.dart';
import '../Repositories/OrderRepository.dart';

class CheckoutViewModel extends ChangeNotifier {
  List<Meal> getCartList() {
    return OrderRepository.cartList;
  }

  void emptyCart() {
    OrderRepository.cartList = [];
  }

  late OrderResponse createOrderResult;
  String messageResult = '';

  String get message => messageResult;
  OrderResponse get result => createOrderResult;

  // Call createOrder function from the repository to be returned to the view
  Future<dynamic> createOrder(List<Meal> cart) async {
    try {
      final createOrder = await CheckoutRepository().createOrder(cart);
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
