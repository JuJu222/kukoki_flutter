import 'dart:async';
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
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../Models/Meal.dart';
import '../Models/UserResponse.dart';
import '../ViewModels/OrderViewModel.dart';
import 'WebviewMidtransPage.dart';

class CheckoutPage extends StatefulWidget {
  static const routeName = 'Checkout';

  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  bool isLoading = true;
  int totalPricingFull = 0;
  int totalPricing = 0;
  late OrderViewModel orderViewModel;
  var userResponse;

  Future<void> getUser() async {
    await orderViewModel.getUser().then((result) {
      setState(() {
        userResponse = result as UserResponse;
        if (userResponse != null) {
          isLoading = false;
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    orderViewModel = Provider.of<OrderViewModel>(context, listen: false);
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context)!.settings.arguments as Map;
    List<Meal> tempList = data['currentList'];

    // Calculate total price
    int totalPriceFood(List<Meal> tempList) {
      totalPricing = 0;
      tempList.forEach((e) {
        setState(() {
          var menuPrice = e.menuPrice?.replaceAll('.', '');
          totalPricing += int.parse(menuPrice!);
        });
      });

      return totalPricing;
    }

    // Calculate price
    int totalPrice(
        Function totalPriceFood, int deliveryFee, List<Meal> tempList) {
      totalPricingFull = 0;
      totalPricingFull = totalPriceFood(tempList) + deliveryFee;
      tempList = [];
      return totalPricingFull;
    }

    // Call ViewModel function to redirect to payment gateaway webview
    Future<void> navigatePaymentGateaway(BuildContext context) async {
      var totalPriceVariable =
          '${totalPrice(totalPriceFood, 20000, tempList).toString()}';
      var getPay = await orderViewModel.checkout(
          '${totalPrice(totalPriceFood, 20000, tempList).toString()}');
      final result = await Navigator.pushNamed(
          context, WebviewMidtransPage.routeName,
          arguments: {
            'snapUrl': getPay.snapUrl,
            'totalPayment': '$totalPriceVariable',
            'transactionTime': DateTime.now(),
            'temporaryCart': tempList
          });

      if (result == null) {
      } else {
        ScaffoldMessenger.of(context)
          ..removeCurrentSnackBar()
          ..showSnackBar(SnackBar(
              action: SnackBarAction(
                label: 'OK',
                onPressed: () {},
              ),
              content: Text('$result')));
      }
    }

    return isLoading
        ? Loading.loading()
        : Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(color: Color(0XFF1c9fe2)),
              backgroundColor: Colors.transparent,
              centerTitle: true,
              title: const Text(
                'Checkout',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    fontFamily: 'Quicksand'),
              ),
            ),
            body: SlidingUpPanel(
              minHeight: 105,
              maxHeight: 210,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              panel: Center(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Total',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          fontFamily: 'Quicksand')),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                child: Row(children: [
                                                  const Text('Rp.',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 18,
                                                          fontFamily:
                                                              'Quicksand')),
                                                  SizedBox(width: 2.0),
                                                  Text(
                                                      '${(totalPrice(totalPriceFood, 20000, tempList).toString())}',
                                                      overflow:
                                                          TextOverflow.fade,
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 32,
                                                          fontFamily:
                                                              'Quicksand')),
                                                ]),
                                              ),
                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 40.0,
                                                            vertical: 12.0),
                                                    backgroundColor:
                                                        Color(0xFF1C9FE2),
                                                    elevation: 0.0,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0))),
                                                child: const Text('Order',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16,
                                                        color: Colors.white,
                                                        fontFamily:
                                                            'Quicksand')),
                                                onPressed: () async {
                                                  await CircularProgressIndicator();
                                                  navigatePaymentGateaway(
                                                      context);
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ]),
                ),
              ),
              body: Container(
                width: double.infinity,
                height: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                child: Column(
                  children: [
                    Flexible(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(height: 25.0),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Alamat Pengiriman',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF1C9FE2),
                                          fontSize: 16,
                                          fontFamily: 'Quicksand')),
                                  SizedBox(height: 17),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Icon(
                                                size: 30,
                                                Icons.person,
                                                color: Color(0xFF707070)),
                                            SizedBox(width: 10),
                                            Text(
                                                '${userResponse.user?.fullName}',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xFF707070),
                                                    fontSize: 12,
                                                    fontFamily: 'Quicksand')),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Icon(
                                                size: 30,
                                                Icons.phone_outlined,
                                                color: Color(0xFF707070)),
                                            SizedBox(width: 10),
                                            Text('${userResponse.user?.phone}',
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xFF707070),
                                                    fontSize: 14,
                                                    fontFamily: 'Quicksand')),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 25.0),
                                  Row(
                                    children: [
                                      Icon(
                                          size: 30,
                                          Icons.location_on_outlined,
                                          color: Color(0xFF707070)),
                                      SizedBox(width: 10),
                                      Flexible(
                                        flex: 1,
                                        child: Text(
                                            '${userResponse.user?.address}, ${userResponse.user?.district}, ${userResponse.user?.ward}, Kota ${userResponse.user?.city}, ${userResponse.user?.province}',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xFF707070),
                                                fontSize: 12,
                                                fontFamily: 'Quicksand')),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 25.0),
                            Container(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: const [
                                    Text('Pesanan',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF1C9FE2),
                                            fontSize: 16,
                                            fontFamily: 'Quicksand')),
                                  ],
                                ),
                                SizedBox(height: 5),
                                ...tempList.mapIndexed(
                                  (index, e) {
                                    return CheckoutTile(
                                      pesan: tempList[index],
                                    );
                                  },
                                )
                              ],
                            )),
                            SizedBox(height: 15.0),
                            Container(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: const [
                                      Text('Rincian Pembayaran',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF1C9FE2),
                                              fontSize: 16,
                                              fontFamily: 'Quicksand')),
                                    ],
                                  ),
                                  const SizedBox(height: 10.0),
                                  Card(
                                    elevation: 0.0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        side: BorderSide(
                                            width: 1.4,
                                            color: Color(0xFFBFBFBF))),
                                    child: Container(
                                      padding: EdgeInsets.all(20),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text('Harga Makanan',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.black,
                                                      fontSize: 14,
                                                      fontFamily: 'Quicksand')),
                                              Text(
                                                  'Rp${totalPriceFood(tempList).toString()}',
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.black,
                                                      fontSize: 14,
                                                      fontFamily: 'Quicksand')),
                                            ],
                                          ),
                                          SizedBox(height: 10.0),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: const [
                                              Text('Ongkos Kirim',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.black,
                                                      fontSize: 14,
                                                      fontFamily: 'Quicksand')),
                                              Text('Rp20.000',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.black,
                                                      fontSize: 14,
                                                      fontFamily: 'Quicksand')),
                                            ],
                                          ),
                                          SizedBox(height: 15.0),
                                          Divider(
                                              color: Colors.grey[400],
                                              height: 10),
                                          SizedBox(height: 15.0),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text('Total',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color(0xFF1C9FE2),
                                                      fontSize: 16,
                                                      fontFamily: 'Quicksand')),
                                              Text(
                                                  'Rp${(totalPrice(totalPriceFood, 20000, tempList).toString())}',
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color(0xFF1C9FE2),
                                                      fontSize: 16,
                                                      fontFamily: 'Quicksand')),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20.0),
                                  Container(height: 200, width: double.infinity)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
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
                      style: const TextStyle(
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
                          style: const TextStyle(
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
                          style: const TextStyle(
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
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 10,
                          fontFamily: 'Quicksand',
                          color: Color(0xFF1C9FE2))),
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
                  // const SizedBox(width: 5.0),
                  Text(widget.pesan.menuName!,
                      style: const TextStyle(
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
                      Text('${widget.pesan.numberOfPeople} orang',
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                              color: Color(0xFF6A6A6A),
                              fontFamily: 'Quicksand')),
                    ],
                  ),
                  const SizedBox(width: 16.0),
                  Row(
                    children: [
                      const Icon(Icons.date_range_outlined,
                          size: 22, color: Color(0xFF6A6A6A)),
                      Text('${widget.pesan.date}',
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                              color: Color(0xFF6A6A6A),
                              fontFamily: 'Quicksand')),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 4.0),
              Row(
                children: [
                  // const SizedBox(width: 5.0),
                  Text('Rp.${widget.pesan.menuPrice}',
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 10,
                          fontFamily: 'Quicksand',
                          color: Color(0xFF1C9FE2))),
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

class Loading {
  static Container loading() {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: const SpinKitFadingCircle(
        size: 50,
        color: Color(0xFF1C9FE2),
      ),
    );
  }
}
