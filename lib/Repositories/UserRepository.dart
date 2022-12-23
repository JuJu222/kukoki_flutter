import 'dart:convert';

import 'package:kukoki_flutter/data/services/services.dart';
import 'package:kukoki_flutter/models/OrderResponse.dart';
import 'package:kukoki_flutter/models/UserResponse.dart';

class UserRepository {
  //To call repository in PaymentViewModel
  Future<UserResponse> getUserRepository() async {
    final APIServices apiServices = APIServices();
    dynamic response = await apiServices.getUser(1);

    return UserResponse.fromJson(json.decode(response));
  }
}
