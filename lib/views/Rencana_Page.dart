part of 'pages.dart';

class RencanaPage extends StatefulWidget {
  static const pageName = "Rencana";
  const RencanaPage({super.key});

  @override
  State<RencanaPage> createState() => _RencanaPageState();
}

class _RencanaPageState extends State<RencanaPage> {
  int? currentSelectedIndex = 4;
  List<Pesan> tempList = [];
  double totalPricing = 0;
  late int isWeek = 3;

  List<int> noWeek = [1, 2, 3, 4, 5];
  List<String> week = [
    "1-6 November 2022",
    "7-12 November 2022",
    "13-18 November 2022",
    "19-24 November 2022",
    "25-30 November 2022"
  ];

  List<CardRencana> cardRencanaWeek1 = [
    CardRencana(
        date: "1", day: "Sel", isSelected: false, onSelect: () {}, index: 0),
    CardRencana(
        date: "2", day: "Rab", isSelected: false, onSelect: () {}, index: 0),
    CardRencana(
        date: "3", day: "Kam", isSelected: false, onSelect: () {}, index: 0),
    CardRencana(
        date: "4", day: "Jum", isSelected: false, onSelect: () {}, index: 0),
    CardRencana(
        date: "5", day: "Sab", isSelected: false, onSelect: () {}, index: 0),
    CardRencana(
        date: "6", day: "Min", isSelected: false, onSelect: () {}, index: 0),
  ];

  List<CardRencana> cardRencanaWeek2 = [
    CardRencana(
        date: "7", day: "Sen", isSelected: false, onSelect: () {}, index: 0),
    CardRencana(
        date: "8", day: "Sel", isSelected: false, onSelect: () {}, index: 0),
    CardRencana(
        date: "9", day: "Rab", isSelected: false, onSelect: () {}, index: 0),
    CardRencana(
        date: "10", day: "Kam", isSelected: false, onSelect: () {}, index: 0),
    CardRencana(
        date: "11", day: "Jum", isSelected: false, onSelect: () {}, index: 0),
    CardRencana(
        date: "12", day: "Sab", isSelected: false, onSelect: () {}, index: 0),
  ];

  List<CardRencana> cardRencanaWeek3 = [
    CardRencana(
        date: "13", day: "Min", isSelected: false, onSelect: () {}, index: 0),
    CardRencana(
        date: "14", day: "Sen", isSelected: false, onSelect: () {}, index: 0),
    CardRencana(
        date: "15", day: "Sel", isSelected: false, onSelect: () {}, index: 0),
    CardRencana(
        date: "16", day: "Rab", isSelected: false, onSelect: () {}, index: 0),
    CardRencana(
        date: "17", day: "Kam", isSelected: false, onSelect: () {}, index: 0),
    CardRencana(
        date: "18", day: "Jum", isSelected: false, onSelect: () {}, index: 0),
  ];

  List<CardRencana> cardRencanaWeek4 = [
    CardRencana(
        date: "19", day: "Sab", isSelected: false, onSelect: () {}, index: 0),
    CardRencana(
        date: "20", day: "Min", isSelected: false, onSelect: () {}, index: 0),
    CardRencana(
        date: "21", day: "Sen", isSelected: false, onSelect: () {}, index: 0),
    CardRencana(
        date: "22", day: "Sel", isSelected: false, onSelect: () {}, index: 0),
    CardRencana(
        date: "23", day: "Rab", isSelected: false, onSelect: () {}, index: 0),
    CardRencana(
        date: "24", day: "Kam", isSelected: false, onSelect: () {}, index: 0),
  ];

  List<CardRencana> cardRencanaWeek5 = [
    CardRencana(
        date: "25", day: "Jum", isSelected: false, onSelect: () {}, index: 0),
    CardRencana(
        date: "26", day: "Sab", isSelected: false, onSelect: () {}, index: 0),
    CardRencana(
        date: "27", day: "Min", isSelected: false, onSelect: () {}, index: 0),
    CardRencana(
        date: "28", day: "Sen", isSelected: false, onSelect: () {}, index: 0),
    CardRencana(
        date: "29", day: "Sel", isSelected: false, onSelect: () {}, index: 0),
    CardRencana(
        date: "30", day: "Rab", isSelected: false, onSelect: () {}, index: 0),
  ];

  @override
  initState() {
    super.initState();
    // Add listeners to this class
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
    print(tempList);
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
                  onSelected: (value) {
                    setState(() {
                      isWeek = value;
                      tempList = [];
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
                    });
                  },
                  child: const Icon(Icons.keyboard_arrow_down,
                      size: 24, color: Colors.black),
                  itemBuilder: (context) {
                    return week
                        .mapIndexed((index, item) => PopupMenuItem(
                              value: noWeek[index],
                              child: Text(item),
                            ))
                        .toList();
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
                          backgroundColor: (listKeranjang.isEmpty)
                              ? Colors.grey
                              : const Color(0xFF1C9FE2),
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
                                  checkWeek()[currentSelectedIndex!].date) {}
                            } else {
                              if (item.date!.substring(0, 2) ==
                                  checkWeek()[currentSelectedIndex!].date) {
                                // Navigator.pushNamed(
                                //     context, CheckoutPage.routeName,
                                //     arguments: {
                                //       "currentList": tempList,
                                //     });
                              }
                            }
                          }
                        }
                        Navigator.pushNamed(context, CheckoutPage.routeName,
                            arguments: {
                              "currentList": tempList,
                            });
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
                  //asMap turns list into a Map, get the key and values of the map, item is the index, value is the key
                  Row(
                      // ...ituberdasarkan
                      children: checkWeek().mapIndexed((index, item) {
                    return CardRencana(
                        date: item.date,
                        day: item.day,
                        index: index,
                        isSelected: currentSelectedIndex == index,
                        onSelect: (() {
                          setState(() {
                            currentSelectedIndex = index;
                            tempList = [];
                            for (var itm in listKeranjang) {
                              if (itm.date![1] == " ") {
                                if (itm.date!.substring(0, 1) ==
                                    checkWeek()[currentSelectedIndex!].date) {
                                  tempList.add(itm);
                                }
                              } else {
                                if (itm.date!.substring(0, 2) ==
                                    checkWeek()[currentSelectedIndex!].date) {
                                  tempList.add(itm);
                                }
                              }
                            }
                          });
                        }));
                  }).toList()),
                  // Row(children: cardRencana),
                  const SizedBox(height: 25),
                  //3rd section
                  SizedBox(
                    width: double.infinity,
                    // height: double.infinity,
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
                                      //item yang datenya sama
                                      //filter cuman date yang sama

                                      if (item.date![1] == " ") {
                                        if (item.date!.substring(0, 1) ==
                                            checkWeek()[currentSelectedIndex!]
                                                .date) {
                                          return CheckoutTileWithIcon(
                                            onDelete: () => removeItem(index),
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
                                            onDelete: () => removeItem(index),
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
                  Container(height: 300, width: double.infinity)
                ]),
              ),
            ),
          ),
        ));
  }

  void removeItem(int index) {
    setState(() {
      tempList.removeAt(index);
      listKeranjang.removeAt(index);
    });
  }

  double totalPrice(List<Pesan> tempList) {
    totalPricing = 0;
    tempList.forEach((e) {
      setState(() {
        totalPricing += double.parse(e.menuPrice!);
      });
    });
    return totalPricing;
  }

  List<CardRencana> checkWeek() {
    List<CardRencana> temp = [];
    if (isWeek == 1) {
      temp = cardRencanaWeek1;
    } else if (isWeek == 2) {
      temp = cardRencanaWeek2;
    } else if (isWeek == 3) {
      temp = cardRencanaWeek3;
    } else if (isWeek == 4) {
      temp = cardRencanaWeek4;
    } else if (isWeek == 5) {
      temp = cardRencanaWeek5;
    }
    return temp;
  }
}
