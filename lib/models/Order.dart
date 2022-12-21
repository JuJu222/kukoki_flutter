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

List<Order> listPesan = [
  Order(
    date: "6 November 2022",
    menuName: "Grilled Salmon",
    menuPrice: "80.000",
    images: "assets/images/foods/imagefood1.png",
    numberOfPeople: "4",
    menuId: 0,
  ),
  Order(
    date: "6 November 2022",
    menuName: "Nabe Veggie Udon",
    menuPrice: "50.000",
    images: "assets/images/foods/imagefood3.png",
    numberOfPeople: "4",
    menuId: 49,
  ),
  Order(
    date: "6 November 2022",
    menuName: "Pesto Pasta Chicken",
    menuPrice: "60.000",
    images: "assets/images/foods/imagefood5.png",
    numberOfPeople: "4",
    menuId: 50,
  ),
  Order(
    date: "16 November 2022",
    menuName: "Grilled Salmon",
    menuPrice: "80.000",
    images: "assets/images/foods/imagefood1.png",
    numberOfPeople: "4",
    menuId: 0,
  ),
  Order(
    date: "16 November 2022",
    menuName: "Nabe Veggie Udon",
    menuPrice: "50.000",
    images: "assets/images/foods/imagefood3.png",
    numberOfPeople: "4",
    menuId: 49,
  ),
  Order(
    date: "16 November 2022",
    menuName: "Pesto Pasta Chicken",
    menuPrice: "60.000",
    images: "assets/images/foods/imagefood5.png",
    numberOfPeople: "4",
    menuId: 50,
  ),
  Order(
    date: "16 November 2022",
    menuName: "Unagi Ramen",
    menuPrice: "30.000",
    images: "assets/images/foods/imagefood2.png",
    numberOfPeople: "2",
    menuId: 48,
  ),
];

List<Order> listKeranjang = [
  Order(
    date: "22 November 2022",
    menuName: "Pesto Pasta Chicken",
    menuPrice: "60.000",
    images: "assets/images/foods/imagefood5.png",
    numberOfPeople: "4",
    menuId: 50,
  ),
  Order(
    date: "22 November 2022",
    menuName: "Unagi Ramen",
    menuPrice: "30.000",
    images: "assets/images/foods/imagefood2.png",
    numberOfPeople: "2",
    menuId: 48,
  ),
  Order(
    date: "22 November 2022",
    menuName: "Nabe Veggie Udon",
    menuPrice: "50.000",
    images: "assets/images/foods/imagefood3.png",
    numberOfPeople: "4",
    menuId: 49,
  ),
];
