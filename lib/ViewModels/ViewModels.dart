import 'package:flutter/cupertino.dart';
import 'package:kukoki_flutter/Repositories/PaymentRepository.dart';
import 'package:kukoki_flutter/Repositories/CheckoutRepository.dart';
import 'package:kukoki_flutter/Repositories/UserRepository.dart';
import 'package:kukoki_flutter/models/OrderResponse.dart';
import 'package:kukoki_flutter/models/Payments.dart';
import 'package:kukoki_flutter/models/Meal.dart';
import 'package:kukoki_flutter/models/UserResponse.dart';

part 'PaymentViewModel.dart';
part 'PlanningViewModel.dart';
part 'CheckoutViewModel.dart';
part 'UserViewModel.dart';

enum ResultState { noData, hasData, error }