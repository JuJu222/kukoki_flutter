import 'dart:ui';

class Pesan {
  String? images;
  String? menuName;
  String? numberOfPeople;
  String? menuPrice;
  String? date;
  String? preparationTime;
  int? menuId;
  Pesan(
      {required this.images,
      required this.menuName,
      required this.numberOfPeople,
      required this.menuPrice,
      required this.date,
      this.menuId});
}

List<Pesan> listPesan = [
  Pesan(
    date: "6 November 2022",
    menuName: "Grilled Salmon",
    menuPrice: "80.000",
    images: "assets/images/foods/imagefood1.png",
    numberOfPeople: "4",
    menuId: 0,
  ),
  Pesan(
    date: "6 November 2022",
    menuName: "Nabe Veggie Udon",
    menuPrice: "50.000",
    images: "assets/images/foods/imagefood3.png",
    numberOfPeople: "4",
    menuId: 49,
  ),
  Pesan(
    date: "6 November 2022",
    menuName: "Pesto Pasta Chicken",
    menuPrice: "60.000",
    images: "assets/images/foods/imagefood5.png",
    numberOfPeople: "4",
    menuId: 50,
  ),
  Pesan(
    date: "16 November 2022",
    menuName: "Grilled Salmon",
    menuPrice: "80.000",
    images: "assets/images/foods/imagefood1.png",
    numberOfPeople: "4",
    menuId: 0,
  ),
  Pesan(
    date: "16 November 2022",
    menuName: "Nabe Veggie Udon",
    menuPrice: "50.000",
    images: "assets/images/foods/imagefood3.png",
    numberOfPeople: "4",
    menuId: 49,
  ),
  Pesan(
    date: "16 November 2022",
    menuName: "Pesto Pasta Chicken",
    menuPrice: "60.000",
    images: "assets/images/foods/imagefood5.png",
    numberOfPeople: "4",
    menuId: 50,
  ),
  Pesan(
    date: "16 November 2022",
    menuName: "Unagi Ramen",
    menuPrice: "30.000",
    images: "assets/images/foods/imagefood2.png",
    numberOfPeople: "2",
    menuId: 48,
  ),
];

List<Pesan> listKeranjang = [
  Pesan(
    date: "17 November 2022",
    menuName: "Pesto Pasta Chicken",
    menuPrice: "60.000",
    images: "assets/images/foods/imagefood5.png",
    numberOfPeople: "4",
    menuId: 50,
  ),
  Pesan(
    date: "17 November 2022",
    menuName: "Unagi Ramen",
    menuPrice: "30.000",
    images: "assets/images/foods/imagefood2.png",
    numberOfPeople: "2",
    menuId: 48,
  ),
  Pesan(
    date: "17 November 2022",
    menuName: "Nabe Veggie Udon",
    menuPrice: "50.000",
    images: "assets/images/foods/imagefood3.png",
    numberOfPeople: "4",
    menuId: 49,
  ),
];
