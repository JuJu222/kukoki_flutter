import 'dart:ui';

class Order {
  String? images;
  String? menuName;
  String? numberOfPeople;
  String? menuPrice;
  String? date;
  String? preparationTime;
  int? menuId;
  Order(
      {required this.images,
      required this.menuName,
      required this.numberOfPeople,
      required this.menuPrice,
      required this.date,
      this.menuId});
}

