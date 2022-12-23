part of "ViewModels.dart";

class UserViewModel extends ChangeNotifier {
  late UserResponse getUserResult;
  late ResultState resultState;
  String messageResult = "";

  String get message => messageResult;

  UserResponse get result => getUserResult;

  ResultState get state => resultState;

  //Fetch SnapURL from Midtrans
  Future<dynamic> fetchGetUser() async {
    try {
      final getUser = await UserRepository().getUserRepository();
      if (getUser.status == null) {
        resultState = ResultState.noData;
        notifyListeners();
        return messageResult = "empty data";
      } else {
        resultState = ResultState.hasData;
        notifyListeners();
        return getUserResult = getUser;
      }
    } catch (e) {
      resultState = ResultState.error;
      notifyListeners();
      return messageResult = "ERROR --> $e";
    }
  }
}
