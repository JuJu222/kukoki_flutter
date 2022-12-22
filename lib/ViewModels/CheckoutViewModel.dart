part of 'ViewModels.dart';

class CheckoutViewModel extends ChangeNotifier {
  late OrderResponse createOrderResult;
  late ResultState resultState;
  String messageResult = "";

  String get message => messageResult;

  OrderResponse get result => createOrderResult;

  ResultState get state => resultState;

  //Fetch SnapURL from Midtrans
  Future<dynamic> fetchCreateOrder(List<Meal> cart) async {
    try {
      final createOrder = await CheckoutRepository().getCheckoutRepository(cart);
      if (createOrder.status == null) {
        resultState = ResultState.noData;
        notifyListeners();
        return messageResult = "empty data";
      } else {
        resultState = ResultState.hasData;
        notifyListeners();
        return createOrderResult = createOrder;
      }
    } catch (e) {
      resultState = ResultState.error;
      notifyListeners();
      return messageResult = "ERROR --> $e";
    }
  }
}
