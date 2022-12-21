part of 'pages.dart';

class PlanningPage extends StatefulWidget {
  static const pageName = "Planning";
  const PlanningPage({super.key});

  @override
  State<PlanningPage> createState() => _PlanningPageState();
}

class _PlanningPageState extends State<PlanningPage> {
  // Current selected date
  int? currentSelectedIndex = 3;
  // Current selected week
  late int isWeek = 4;
  double totalPricing = 0;
  List<Order> tempList = [];
  List<int> noWeek = [1, 2, 3, 4, 5];
  // Ranges of dates in each week
  List<String> week = [
    "1-6 November 2022",
    "7-12 November 2022",
    "13-18 November 2022",
    "19-24 November 2022",
    "25-30 November 2022"
  ];
  List<PlanCard> currentMonthWeek1 = [
    PlanCard(
        date: "1", day: "Kam", isSelected: false, onSelect: () {}, index: 0),
    PlanCard(
        date: "2", day: "Jum", isSelected: false, onSelect: () {}, index: 0),
    PlanCard(
        date: "3", day: "Sab", isSelected: false, onSelect: () {}, index: 0),
    PlanCard(
        date: "4", day: "Min", isSelected: false, onSelect: () {}, index: 0),
    PlanCard(
        date: "5", day: "Sen", isSelected: false, onSelect: () {}, index: 0),
    PlanCard(
        date: "6", day: "Sel", isSelected: false, onSelect: () {}, index: 0),
  ];
  List<PlanCard> currentMonthWeek2 = [
    PlanCard(
        date: "7", day: "Rab", isSelected: false, onSelect: () {}, index: 0),
    PlanCard(
        date: "8", day: "Kam", isSelected: false, onSelect: () {}, index: 0),
    PlanCard(
        date: "9", day: "Jum", isSelected: false, onSelect: () {}, index: 0),
    PlanCard(
        date: "10", day: "Sab", isSelected: false, onSelect: () {}, index: 0),
    PlanCard(
        date: "11", day: "Min", isSelected: false, onSelect: () {}, index: 0),
    PlanCard(
        date: "12", day: "Sen", isSelected: false, onSelect: () {}, index: 0),
  ];
  List<PlanCard> currentMonthWeek3 = [
    PlanCard(
        date: "13", day: "Sel", isSelected: false, onSelect: () {}, index: 0),
    PlanCard(
        date: "14", day: "Rab", isSelected: false, onSelect: () {}, index: 0),
    PlanCard(
        date: "15", day: "Kam", isSelected: false, onSelect: () {}, index: 0),
    PlanCard(
        date: "16", day: "Jum", isSelected: false, onSelect: () {}, index: 0),
    PlanCard(
        date: "17", day: "Sab", isSelected: false, onSelect: () {}, index: 0),
    PlanCard(
        date: "18", day: "Min", isSelected: false, onSelect: () {}, index: 0),
  ];
  List<PlanCard> currentMonthWeek4 = [
    PlanCard(
        date: "19", day: "Sen", isSelected: false, onSelect: () {}, index: 0),
    PlanCard(
        date: "20", day: "Sel", isSelected: false, onSelect: () {}, index: 0),
    PlanCard(
        date: "21", day: "Rab", isSelected: false, onSelect: () {}, index: 0),
    PlanCard(
        date: "22", day: "Kam", isSelected: false, onSelect: () {}, index: 0),
    PlanCard(
        date: "23", day: "Jum", isSelected: false, onSelect: () {}, index: 0),
    PlanCard(
        date: "24", day: "Sab", isSelected: false, onSelect: () {}, index: 0),
  ];
  List<PlanCard> currentMonthWeek5 = [
    PlanCard(
        date: "25", day: "Min", isSelected: false, onSelect: () {}, index: 0),
    PlanCard(
        date: "26", day: "Sen", isSelected: false, onSelect: () {}, index: 0),
    PlanCard(
        date: "27", day: "Sel", isSelected: false, onSelect: () {}, index: 0),
    PlanCard(
        date: "28", day: "Rab", isSelected: false, onSelect: () {}, index: 0),
    PlanCard(
        date: "29", day: "Kam", isSelected: false, onSelect: () {}, index: 0),
    PlanCard(
        date: "30", day: "Jum", isSelected: false, onSelect: () {}, index: 0),
  ];

  // Remove a mealkit on the cart when delete icon is clicked
  void removeItem(int index) {
    setState(() {
      tempList.removeAt(index);
      listKeranjang.removeAt(index);
    });
  }

  // Count total price of mealkits in the cart
  double totalPrice(List<Order> tempList) {
    totalPricing = 0;
    for (var e in tempList) {
      setState(() {
        totalPricing += double.parse(e.menuPrice!);
      });
    }
    return totalPricing;
  }

  // Check and return the current week
  List<PlanCard> checkWeek() {
    List<PlanCard> temp = [];
    if (isWeek == 1) {
      temp = currentMonthWeek1;
    } else if (isWeek == 2) {
      temp = currentMonthWeek2;
    } else if (isWeek == 3) {
      temp = currentMonthWeek3;
    } else if (isWeek == 4) {
      temp = currentMonthWeek4;
    } else if (isWeek == 5) {
      temp = currentMonthWeek5;
    }
    return temp;
  }

  @override
  initState() {
    super.initState();
    for (var item in listKeranjang) {
      if (item.date![1] == " ") {
        if (item.date!.substring(0, 1) ==
            checkWeek()[currentSelectedIndex!].date) {
          tempList.add(item);
        }
      } else {
        if (item.date!.substring(0, 2) ==
            checkWeek()[currentSelectedIndex!].date) {
          tempList.add(item);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Container(
            padding: const EdgeInsets.all(4),
            child: Row(
              children: [
                Text(
                  "${checkWeek()[0].date}-${checkWeek()[checkWeek().length - 1].date} November 2022",
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      fontFamily: "Quicksand"),
                ),
                const SizedBox(width: 5),
                PopupMenuButton(
                  child: const Icon(Icons.keyboard_arrow_down,
                      size: 24, color: Colors.black),
                  itemBuilder: (context) {
                    return [];
                  },
                )
              ],
            ),
          ),
        ),
        body: SlidingUpPanel(
          key: UniqueKey(),
          maxHeight: 100,
          boxShadow: const [
            BoxShadow(blurRadius: 10, color: Color(0x0f000000))
          ],
          borderRadius: const BorderRadius.horizontal(
              left: Radius.circular(22), right: Radius.circular(22)),
          panel: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Total",
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            fontFamily: "Quicksand",
                            color: const Color(0xFF6A6A6A))),
                    Text(
                        (listKeranjang.isEmpty)
                            ? "0"
                            : "Rp${totalPrice(tempList).toString()}00",
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontFamily: "Quicksand"))
                  ],
                ),
                Column(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10.0),
                          backgroundColor: (listKeranjang.any((item) {
                            if (item.date![1] == " ") {
                              if (item.date!.substring(0, 1) ==
                                  checkWeek()[currentSelectedIndex!].date) {
                                return true;
                              }
                            } else if (item.date!.substring(0, 2) ==
                                checkWeek()[currentSelectedIndex!].date) {
                              return true;
                            }
                            return false;
                          }))
                              ? const Color(0xFF1C9FE2)
                              : Colors.grey,
                          elevation: 0.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                      child: Text("Checkout",
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontFamily: "Quicksand")),
                      onPressed: () {
                        if (listKeranjang.isNotEmpty) {
                          for (var item in listKeranjang) {
                            if (item.date![1] == " ") {
                              if (item.date!.substring(0, 1) ==
                                  checkWeek()[currentSelectedIndex!].date) {
                                Navigator.pushNamed(
                                    context, CheckoutPage.routeName,
                                    arguments: {
                                      "currentList": tempList,
                                    });
                                break;
                              } else {
                                ScaffoldMessenger.of(context)
                                  ..removeCurrentSnackBar()
                                  ..showSnackBar(SnackBar(
                                      action: SnackBarAction(
                                        label: "OK",
                                        onPressed: () {},
                                      ),
                                      content: Text('No meal kits in cart')));
                              }
                            } else {
                              if (item.date!.substring(0, 2) ==
                                  checkWeek()[currentSelectedIndex!].date) {
                                Navigator.pushNamed(
                                    context, CheckoutPage.routeName,
                                    arguments: {
                                      "currentList": tempList,
                                    });
                                break;
                              } else {
                                ScaffoldMessenger.of(context)
                                  ..removeCurrentSnackBar()
                                  ..showSnackBar(SnackBar(
                                      action: SnackBarAction(
                                        label: "OK",
                                        onPressed: () {},
                                      ),
                                      content: Text('No meal kits in cart')));
                              }
                            }
                          }
                        }
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
          body: SafeArea(
            child: Container(
              padding: const EdgeInsets.all(12),
              width: double.infinity,
              height: double.infinity,
              child: SingleChildScrollView(
                child: Column(children: [
                  Row(
                      children: checkWeek().mapIndexed((index, item) {
                    return PlanCard(
                        date: item.date,
                        day: item.day,
                        index: index,
                        isSelected: currentSelectedIndex == index,
                        onSelect: (() {}));
                  }).toList()),
                  const SizedBox(height: 25),
                  SizedBox(
                    width: double.infinity,
                    child: Column(children: [
                      Align(
                          alignment: Alignment.topLeft,
                          child: Row(
                            children: [
                              const SizedBox(width: 10.0),
                              Text("Telah Dipesan",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          fontFamily: "Quicksand")),
                            ],
                          )),
                      const SizedBox(height: 15.0),
                      SingleChildScrollView(
                          child: (listPesan.isEmpty)
                              ? const Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                      "Tidak ada meal kit yang telah dipesan",
                                      style: TextStyle(
                                          fontFamily: "Quicksand",
                                          fontWeight: FontWeight.w500)),
                                )
                              : Column(
                                  children: listPesan.mapIndexed(
                                  (index, item) {
                                    if (item.date![1] == " ") {
                                      if (item.date!.substring(0, 1) ==
                                          checkWeek()[currentSelectedIndex!]
                                              .date) {
                                        return CheckoutTile(
                                          pesan: item,
                                        );
                                      } else {
                                        return Container();
                                      }
                                    } else {
                                      if (item.date!.substring(0, 2) ==
                                          checkWeek()[currentSelectedIndex!]
                                              .date) {
                                        return CheckoutTile(
                                          pesan: item,
                                        );
                                      } else {
                                        return Container();
                                      }
                                    }
                                  },
                                ).toList())),
                      const SizedBox(height: 15.0),
                      Row(
                        children: [
                          const SizedBox(width: 10.0),
                          Text("Keranjang",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      fontFamily: "Quicksand")),
                        ],
                      ),
                      const SizedBox(height: 15.0),
                      SingleChildScrollView(
                          child: (listKeranjang.isEmpty)
                              ? const Align(
                                  alignment: Alignment.center,
                                  child: Text("Tidak ada meal kit dikeranjang"),
                                )
                              : Column(
                                  children: listKeranjang.mapIndexed(
                                    (index, item) {
                                      if (item.date![1] == " ") {
                                        if (item.date!.substring(0, 1) ==
                                            checkWeek()[currentSelectedIndex!]
                                                .date) {
                                          return CheckoutTileWithIcon(
                                            onDelete: () {},
                                            pesan: listKeranjang[index],
                                          );
                                        } else {
                                          return Container();
                                        }
                                      } else {
                                        if (item.date!.substring(0, 2) ==
                                            checkWeek()[currentSelectedIndex!]
                                                .date) {
                                          return CheckoutTileWithIcon(
                                            onDelete: () {},
                                            pesan: listKeranjang[index],
                                          );
                                        } else {
                                          return Container();
                                        }
                                      }
                                    },
                                  ).toList(),
                                ))
                    ]),
                  ),
                  const SizedBox(height: 300, width: double.infinity)
                ]),
              ),
            ),
          ),
        ));
  }
}
