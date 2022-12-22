part of "ViewModels.dart";

class PlanningViewModel extends ChangeNotifier {
  List<Meal> cartList = [
    Meal(
      date: "22 November 2022",
      menuName: "Pesto Pasta Chicken",
      menuPrice: "60.000",
      images: "assets/images/foods/imagefood5.png",
      numberOfPeople: "4",
      menuId: 50,
    ),
    Meal(
      date: "22 November 2022",
      menuName: "Unagi Ramen",
      menuPrice: "30.000",
      images: "assets/images/foods/imagefood2.png",
      numberOfPeople: "2",
      menuId: 48,
    ),
    Meal(
      date: "22 November 2022",
      menuName: "Nabe Veggie Udon",
      menuPrice: "50.000",
      images: "assets/images/foods/imagefood3.png",
      numberOfPeople: "4",
      menuId: 49,
    ),
  ];

  List<Meal> orderList = [
  Meal(
    date: "6 November 2022",
    menuName: "Grilled Salmon",
    menuPrice: "80.000",
    images: "assets/images/foods/imagefood1.png",
    numberOfPeople: "4",
    menuId: 0,
  ),
  Meal(
    date: "6 November 2022",
    menuName: "Nabe Veggie Udon",
    menuPrice: "50.000",
    images: "assets/images/foods/imagefood3.png",
    numberOfPeople: "4",
    menuId: 49,
  ),
  Meal(
    date: "6 November 2022",
    menuName: "Pesto Pasta Chicken",
    menuPrice: "60.000",
    images: "assets/images/foods/imagefood5.png",
    numberOfPeople: "4",
    menuId: 50,
  ),
  Meal(
    date: "16 November 2022",
    menuName: "Grilled Salmon",
    menuPrice: "80.000",
    images: "assets/images/foods/imagefood1.png",
    numberOfPeople: "4",
    menuId: 0,
  ),
  Meal(
    date: "16 November 2022",
    menuName: "Nabe Veggie Udon",
    menuPrice: "50.000",
    images: "assets/images/foods/imagefood3.png",
    numberOfPeople: "4",
    menuId: 49,
  ),
  Meal(
    date: "16 November 2022",
    menuName: "Pesto Pasta Chicken",
    menuPrice: "60.000",
    images: "assets/images/foods/imagefood5.png",
    numberOfPeople: "4",
    menuId: 50,
  ),
  Meal(
    date: "16 November 2022",
    menuName: "Unagi Ramen",
    menuPrice: "30.000",
    images: "assets/images/foods/imagefood2.png",
    numberOfPeople: "2",
    menuId: 48,
  ),
];
}
