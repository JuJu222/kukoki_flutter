import 'dart:ui';
import 'package:collection/collection.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../Models/Meal.dart';
import '../ViewModels/OrderViewModel.dart';
import 'CheckoutPage.dart';

class PlanningPage extends StatefulWidget {
  static const pageName = 'Planning';
  const PlanningPage({super.key});

  @override
  State<PlanningPage> createState() => _PlanningPageState();
}

class _PlanningPageState extends State<PlanningPage> {
  int? currentSelectedIndex = 3;
  late int isWeek = 4;
  late OrderViewModel orderViewModel;
  double totalPricing = 0;
  List<Meal> tempList = [];
  List<int> noWeek = [1, 2, 3, 4, 5];
  List<String> week = [
    '1-6 November 2022',
    '7-12 November 2022',
    '13-18 November 2022',
    '19-24 November 2022',
    '25-30 November 2022'
  ];
  List<PlanCard> currentMonthWeek1 = [
    PlanCard(
        date: '1', day: 'Kam', isSelected: false, onSelect: () {}, index: 0),
    PlanCard(
        date: '2', day: 'Jum', isSelected: false, onSelect: () {}, index: 0),
    PlanCard(
        date: '3', day: 'Sab', isSelected: false, onSelect: () {}, index: 0),
    PlanCard(
        date: '4', day: 'Min', isSelected: false, onSelect: () {}, index: 0),
    PlanCard(
        date: '5', day: 'Sen', isSelected: false, onSelect: () {}, index: 0),
    PlanCard(
        date: '6', day: 'Sel', isSelected: false, onSelect: () {}, index: 0),
  ];
  List<PlanCard> currentMonthWeek2 = [
    PlanCard(
        date: '7', day: 'Rab', isSelected: false, onSelect: () {}, index: 0),
    PlanCard(
        date: '8', day: 'Kam', isSelected: false, onSelect: () {}, index: 0),
    PlanCard(
        date: '9', day: 'Jum', isSelected: false, onSelect: () {}, index: 0),
    PlanCard(
        date: '10', day: 'Sab', isSelected: false, onSelect: () {}, index: 0),
    PlanCard(
        date: '11', day: 'Min', isSelected: false, onSelect: () {}, index: 0),
    PlanCard(
        date: '12', day: 'Sen', isSelected: false, onSelect: () {}, index: 0),
  ];
  List<PlanCard> currentMonthWeek3 = [
    PlanCard(
        date: '13', day: 'Sel', isSelected: false, onSelect: () {}, index: 0),
    PlanCard(
        date: '14', day: 'Rab', isSelected: false, onSelect: () {}, index: 0),
    PlanCard(
        date: '15', day: 'Kam', isSelected: false, onSelect: () {}, index: 0),
    PlanCard(
        date: '16', day: 'Jum', isSelected: false, onSelect: () {}, index: 0),
    PlanCard(
        date: '17', day: 'Sab', isSelected: false, onSelect: () {}, index: 0),
    PlanCard(
        date: '18', day: 'Min', isSelected: false, onSelect: () {}, index: 0),
  ];
  List<PlanCard> currentMonthWeek4 = [
    PlanCard(
        date: '19', day: 'Sen', isSelected: false, onSelect: () {}, index: 0),
    PlanCard(
        date: '20', day: 'Sel', isSelected: false, onSelect: () {}, index: 0),
    PlanCard(
        date: '21', day: 'Rab', isSelected: false, onSelect: () {}, index: 0),
    PlanCard(
        date: '22', day: 'Kam', isSelected: false, onSelect: () {}, index: 0),
    PlanCard(
        date: '23', day: 'Jum', isSelected: false, onSelect: () {}, index: 0),
    PlanCard(
        date: '24', day: 'Sab', isSelected: false, onSelect: () {}, index: 0),
  ];
  List<PlanCard> currentMonthWeek5 = [
    PlanCard(
        date: '25', day: 'Min', isSelected: false, onSelect: () {}, index: 0),
    PlanCard(
        date: '26', day: 'Sen', isSelected: false, onSelect: () {}, index: 0),
    PlanCard(
        date: '27', day: 'Sel', isSelected: false, onSelect: () {}, index: 0),
    PlanCard(
        date: '28', day: 'Rab', isSelected: false, onSelect: () {}, index: 0),
    PlanCard(
        date: '29', day: 'Kam', isSelected: false, onSelect: () {}, index: 0),
    PlanCard(
        date: '30', day: 'Jum', isSelected: false, onSelect: () {}, index: 0),
  ];

  // Remove a mealkit on the cart when delete icon is clicked
  void removeItem(int index) {
    setState(() {
      tempList.removeAt(index);
      orderViewModel.getCartList().removeAt(index);
    });
  }

  // Count total price of mealkits in the cart
  double totalPrice(List<Meal> tempList) {
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
    orderViewModel = Provider.of<OrderViewModel>(context, listen: false);
    for (var item in orderViewModel.getCartList()) {
      if (item.date![1] == ' ') {
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
                  '${checkWeek()[0].date}-${checkWeek()[checkWeek().length - 1].date} November 2022',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      fontFamily: 'Quicksand'),
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
                    Text('Total',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            fontFamily: 'Quicksand',
                            color: const Color(0xFF6A6A6A))),
                    Text(
                        (orderViewModel.getCartList().isEmpty)
                            ? '0'
                            : 'Rp${totalPrice(tempList).toString()}00',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontFamily: 'Quicksand'))
                  ],
                ),
                Column(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10.0),
                          backgroundColor:
                              (orderViewModel.getCartList().any((item) {
                            if (item.date![1] == ' ') {
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
                      child: Text('Checkout',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white,
                              fontFamily: 'Quicksand')),
                      onPressed: () {
                        if (orderViewModel.getCartList().isNotEmpty) {
                          for (var item in orderViewModel.getCartList()) {
                            if (item.date![1] == ' ') {
                              if (item.date!.substring(0, 1) ==
                                  checkWeek()[currentSelectedIndex!].date) {
                                Navigator.pushNamed(
                                    context, CheckoutPage.routeName,
                                    arguments: {
                                      'currentList': tempList,
                                    });
                                break;
                              } else {
                                ScaffoldMessenger.of(context)
                                  ..removeCurrentSnackBar()
                                  ..showSnackBar(SnackBar(
                                      action: SnackBarAction(
                                        label: 'OK',
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
                                      'currentList': tempList,
                                    });
                                break;
                              } else {
                                ScaffoldMessenger.of(context)
                                  ..removeCurrentSnackBar()
                                  ..showSnackBar(SnackBar(
                                      action: SnackBarAction(
                                        label: 'OK',
                                        onPressed: () {},
                                      ),
                                      content: Text('No meal kits in cart')));
                              }
                            }
                          }
                        } else {
                          ScaffoldMessenger.of(context)
                            ..removeCurrentSnackBar()
                            ..showSnackBar(SnackBar(
                                action: SnackBarAction(
                                  label: 'OK',
                                  onPressed: () {},
                                ),
                                content: Text('No meal kits in cart')));
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
                              Text('Ordered Meal Kits',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      fontFamily: 'Quicksand')),
                            ],
                          )),
                      const SizedBox(height: 15.0),
                      SingleChildScrollView(
                          child: (orderViewModel.getOrderList().isEmpty)
                              ? const Align(
                                  alignment: Alignment.center,
                                  child: Text('No ordered meal kits',
                                      style: TextStyle(
                                          fontFamily: 'Quicksand',
                                          fontWeight: FontWeight.w500)),
                                )
                              : Column(
                                  children:
                                      orderViewModel.getOrderList().mapIndexed(
                                  (index, item) {
                                    if (item.date![1] == ' ') {
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
                          Text('Cart',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  fontFamily: 'Quicksand')),
                        ],
                      ),
                      const SizedBox(height: 15.0),
                      SingleChildScrollView(
                          child: (orderViewModel.getCartList().isEmpty)
                              ? const Align(
                                  alignment: Alignment.center,
                                  child: Text('No meal kits in cart'),
                                )
                              : Column(
                                  children:
                                      orderViewModel.getCartList().mapIndexed(
                                    (index, item) {
                                      if (item.date![1] == ' ') {
                                        if (item.date!.substring(0, 1) ==
                                            checkWeek()[currentSelectedIndex!]
                                                .date) {
                                          return CheckoutTileWithIcon(
                                            onDelete: () {},
                                            pesan: orderViewModel
                                                .getCartList()[index],
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
                                            pesan: orderViewModel
                                                .getCartList()[index],
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

class PlanCard extends StatefulWidget {
  bool isSelected;
  int index;
  VoidCallback onSelect;
  final String day;
  final String date;

  PlanCard({
    super.key,
    required this.index,
    required this.day,
    required this.date,
    required this.isSelected,
    required this.onSelect,
  });

  @override
  State<PlanCard> createState() => _PlanCardState();
}

class _PlanCardState extends State<PlanCard> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7),
        child: GestureDetector(
          onTap: widget.onSelect,
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 2.0),
            color: (widget.isSelected)
                ? const Color(0xFF1C9FE2)
                : Color(0xF2F2F2).withOpacity(1),
            elevation: 0.0,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(children: [
                Text(widget.day,
                    style: (widget.isSelected)
                        ? TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Quicksand',
                            color: Colors.white)
                        : TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Quicksand',
                            color: Color(0xF6A6A6A).withOpacity(1.0))),
                SizedBox(height: 3.0),
                Text(widget.date,
                    style: (widget.isSelected)
                        ? TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            fontFamily: 'Quicksand',
                            color: Colors.white)
                        : TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            fontFamily: 'Quicksand',
                            color: Color(0xF6A6A6A).withOpacity(1.0))),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

class CheckoutTile extends StatelessWidget {
  final Meal pesan;
  const CheckoutTile({super.key, required this.pesan});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      child: GFListTile(
          margin: const EdgeInsets.all(0),
          padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 0.0),
          avatar: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(
              '${pesan.images}',
              width: 79,
              height: 79,
              fit: BoxFit.fill,
            ),
          ),
          title: Row(
            children: [
              Row(
                children: [
                  // const SizedBox(width: 5.0),
                  Text(pesan.menuName!,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          fontFamily: 'Quicksand')),
                ],
              ),
            ],
          ),
          subTitle: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // const SizedBox(width: 5.0),
                  Row(
                    children: [
                      const Icon(Icons.group,
                          size: 22, color: Color(0xFF6A6A6A)),
                      Text('${pesan.numberOfPeople} orang',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                              color: const Color(0xFF6A6A6A),
                              fontFamily: 'Quicksand')),
                    ],
                  ),
                  const SizedBox(width: 16.0),
                  Row(
                    children: [
                      const Icon(Icons.date_range_outlined,
                          size: 22, color: Color(0xFF6A6A6A)),
                      Text('${pesan.date}',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                              color: const Color(0xFF6A6A6A),
                              fontFamily: 'Quicksand')),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 4.0),
              Row(
                children: [
                  // const SizedBox(width: 5.0),
                  Text('Rp.${pesan.menuPrice}',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 10,
                          fontFamily: 'Quicksand',
                          color: const Color(0xFF1C9FE2))),
                ],
              ),
            ],
          ),
          icon: GestureDetector(
            onTap: () {},
            child: Icon(Icons.keyboard_arrow_right_rounded),
          )),
    );
  }
}

class CheckoutTileWithIcon extends StatefulWidget {
  Meal pesan;
  Function onDelete;
  CheckoutTileWithIcon(
      {super.key, required this.pesan, required this.onDelete});

  @override
  State<CheckoutTileWithIcon> createState() => _CheckoutTileWithIconState();
}

class _CheckoutTileWithIconState extends State<CheckoutTileWithIcon> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      child: GFListTile(
          margin: const EdgeInsets.all(0),
          padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 0.0),
          avatar: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset('${widget.pesan.images}',
                width: 79, height: 79, fit: BoxFit.fill),
          ),
          title: Row(
            children: [
              Row(
                children: [
                  Text(widget.pesan.menuName!,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          fontFamily: 'Quicksand')),
                ],
              ),
            ],
          ),
          subTitle: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.group,
                          size: 22, color: Color(0xFF6A6A6A)),
                      Text('${widget.pesan.numberOfPeople} orang',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                              color: const Color(0xFF6A6A6A),
                              fontFamily: 'Quicksand')),
                    ],
                  ),
                  const SizedBox(width: 16.0),
                  Row(
                    children: [
                      const Icon(Icons.date_range_outlined,
                          size: 22, color: Color(0xFF6A6A6A)),
                      Text('${widget.pesan.date}',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                              color: const Color(0xFF6A6A6A),
                              fontFamily: 'Quicksand')),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 4.0),
              Row(
                children: [
                  Text('Rp.${widget.pesan.menuPrice}',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 10,
                          fontFamily: 'Quicksand',
                          color: const Color(0xFF1C9FE2))),
                ],
              ),
            ],
          ),
          icon: GestureDetector(
            onTap: () {
              setState(() {
                widget.onDelete();
              });
            },
            child: const CircleAvatar(
                backgroundColor: Color(0xFF703900),
                child: Icon(Icons.delete_outline_rounded, color: Colors.white)),
          )),
    );
  }
}
