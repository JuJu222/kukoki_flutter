import 'dart:ui';

class Meal {
  String? images;
  String? menuName;
  String? numberOfPeople;
  String? menuPrice;
  String? date;
  String? preparationTime;
  int? menuId;
  Meal(
      {required this.images,
      required this.menuName,
      required this.numberOfPeople,
      required this.menuPrice,
      required this.date,
      this.menuId});
}

