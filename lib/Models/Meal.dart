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

  // Convert Meal object to JSON
  Map<String, dynamic> toJson(){
    return {
      'meal_id': menuId,
      'portion': numberOfPeople,
      'date': date,
    };
  }
}
