import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Models/CheckoutResponse.dart';
import '../Models/Meal.dart';
import '../Models/UserResponse.dart';

class OrderRepository {
static List<Meal> cartList = [
    Meal(
      date: '22 November 2022',
      menuName: 'Pesto Pasta Chicken',
      menuPrice: '60.000',
      images: 'assets/images/foods/imagefood5.png',
      numberOfPeople: '4',
      menuId: 1,
    ),
    Meal(
      date: '22 November 2022',
      menuName: 'Unagi Ramen',
      menuPrice: '30.000',
      images: 'assets/images/foods/imagefood2.png',
      numberOfPeople: '2',
      menuId: 2,
    ),
    Meal(
      date: '22 November 2022',
      menuName: 'Nabe Veggie Udon',
      menuPrice: '50.000',
      images: 'assets/images/foods/imagefood3.png',
      numberOfPeople: '4',
      menuId: 3,
    ),
  ];

  static List<Meal> orderList = [
    Meal(
      date: '6 November 2022',
      menuName: 'Grilled Salmon',
      menuPrice: '80.000',
      images: 'assets/images/foods/imagefood1.png',
      numberOfPeople: '4',
      menuId: 0,
    ),
    Meal(
      date: '6 November 2022',
      menuName: 'Nabe Veggie Udon',
      menuPrice: '50.000',
      images: 'assets/images/foods/imagefood3.png',
      numberOfPeople: '4',
      menuId: 3,
    ),
    Meal(
      date: '6 November 2022',
      menuName: 'Pesto Pasta Chicken',
      menuPrice: '60.000',
      images: 'assets/images/foods/imagefood5.png',
      numberOfPeople: '4',
      menuId: 1,
    ),
    Meal(
      date: '16 November 2022',
      menuName: 'Grilled Salmon',
      menuPrice: '80.000',
      images: 'assets/images/foods/imagefood1.png',
      numberOfPeople: '4',
      menuId: 0,
    ),
    Meal(
      date: '16 November 2022',
      menuName: 'Nabe Veggie Udon',
      menuPrice: '50.000',
      images: 'assets/images/foods/imagefood3.png',
      numberOfPeople: '4',
      menuId: 3,
    ),
    Meal(
      date: '16 November 2022',
      menuName: 'Pesto Pasta Chicken',
      menuPrice: '60.000',
      images: 'assets/images/foods/imagefood5.png',
      numberOfPeople: '4',
      menuId: 1,
    ),
    Meal(
      date: '16 November 2022',
      menuName: 'Unagi Ramen',
      menuPrice: '30.000',
      images: 'assets/images/foods/imagefood2.png',
      numberOfPeople: '2',
      menuId: 2,
    ),
  ];

  // Return Midtrans' snap token in JSON to be passed on to the mobile app through existing User ID.
  Future<dynamic> checkout(String total) async {
    var response =
        await http.post(Uri.parse('https://se.kukoki.com/api/checkout'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, dynamic>{
              'userID': '1',
              'total': total,
            }));

    return CheckoutResponse.fromJson(json.decode(response.body));
  }

  // Get user's info to get their delivery details to be shown on the checkout page
  Future<dynamic> getUser(int userID) async {
    var response = await http.get(
      Uri.parse('https://se.kukoki.com/api/user/${userID.toString()}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    return UserResponse.fromJson(json.decode(response.body));
  }
}
