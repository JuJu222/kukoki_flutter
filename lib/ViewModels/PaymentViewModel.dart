part of 'ViewModels.dart';

enum ResultState { noData, hasData, error }

class PaymentViewModel extends ChangeNotifier {
  late Payments paymentResult;
  late ResultState resultState;
  String messageResult = "";

  String get message => messageResult;

  Payments get result => paymentResult;

  ResultState get state => resultState;

  Future<dynamic> fetchPaymentGateaway(String amount) async {
    try {
      final getPayment = await PaymentRepository().getPaymentRepository(amount);
      if (getPayment.snapUrl == null) {
        resultState = ResultState.noData;
        notifyListeners();
        return messageResult = "empty data";
      } else {
        resultState = ResultState.hasData;
        notifyListeners();
        return paymentResult = getPayment;
      }
    } catch (e) {
      resultState = ResultState.error;
      notifyListeners();
      return messageResult = "ERROR --> $e";
    }
  }
}
