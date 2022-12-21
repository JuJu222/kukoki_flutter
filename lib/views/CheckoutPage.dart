part of "pages.dart";

class CheckoutPage extends StatefulWidget {
  static const routeName = "Checkout";
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  int totalPricingFull = 0;
  int totalPricing = 0;

  late PaymentViewModel vm;

  @override
  void initState() {
    super.initState();
    vm = Provider.of<PaymentViewModel>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context)!.settings.arguments as Map;
    List<Pesan> tempList = data["currentList"];

    // Calculate total price
    int totalPriceFood(List<Pesan> tempList) {
      totalPricing = 0;
      tempList.forEach((e) {
        setState(() {
          var menuPrice = e.menuPrice?.replaceAll('.', '');
          totalPricing += int.parse(menuPrice!);
        });
      });
      print(totalPricing);
      return totalPricing;
    }

    // Calculate price
    int totalPrice(
        Function totalPriceFood, int ongkosKirim, List<Pesan> tempList) {
      totalPricingFull = 0;
      totalPricingFull = totalPriceFood(tempList) + ongkosKirim;
      tempList = [];
      return totalPricingFull;
    }

    Future<void> _NavigatePaymentGateaway(BuildContext context) async {
      var totalPriceVariable =
          "${totalPrice(totalPriceFood, 20000, tempList).toString()}";

      var getpay = await vm.fetchPaymentGateaway(
          "${totalPrice(totalPriceFood, 20000, tempList).toString()}");

      final result = await Navigator.pushNamed(
          context, WebviewMidtrans.routeName,
          arguments: {
            "snapUrl": getpay.snapUrl,
            "totalPembayaran": "$totalPriceVariable",
            "waktuTransaksi": DateTime.now(),
            "tempListKeranjang": tempList
          });

      if (!mounted) return;

      // After the Selection Screen returns a result, hide any previous snackbars and show the new result.
      if (result == null) {
      } else {
        ScaffoldMessenger.of(context)
          ..removeCurrentSnackBar()
          ..showSnackBar(SnackBar(
              action: SnackBarAction(
                label: "OK",
                onPressed: () {},
              ),
              content: Text('$result')));
      }
    }

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: primaryColor),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Checkout",
          style: Theme.of(context).textTheme.headline5!.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              fontFamily: "Quicksand"),
        ),
      ),
      body: SlidingUpPanel(
        minHeight: 105,
        maxHeight: 210,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        panel: Center(
          child: Container(
            padding: EdgeInsets.all(10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Total",
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    fontFamily: "Quicksand")),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Row(children: [
                                        Text("Rp.",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline5!
                                                .copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18,
                                                    fontFamily: "Quicksand")),
                                        SizedBox(width: 2.0),
                                        Text(
                                            "${(totalPrice(totalPriceFood, 20000, tempList).toString())}",
                                            overflow: TextOverflow.fade,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline5!
                                                .copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 32,
                                                    fontFamily: "Quicksand")),
                                      ]),
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 40.0, vertical: 12.0),
                                          backgroundColor: Color(0xFF1C9FE2),
                                          elevation: 0.0,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5.0))),
                                      child: Text("Pesan",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5!
                                              .copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                  fontFamily: "Quicksand")),
                                      onPressed: () async {
                                        await CircularProgressIndicator();
                                        _NavigatePaymentGateaway(context);
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
                            Text("Alamat Pengiriman",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF1C9FE2),
                                        fontSize: 16,
                                        fontFamily: "Quicksand")),
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
                                      Text("Kenny Jinhiro",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5!
                                              .copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xFF707070),
                                                  fontSize: 12,
                                                  fontFamily: "Quicksand")),
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
                                      Text("0812345678901",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5!
                                              .copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xFF707070),
                                                  fontSize: 14,
                                                  fontFamily: "Quicksand")),
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
                                      "Jl. CitraLand CBD Boulevard, Made, Kec. Sambikerep, Kota SBY, Jawa Timur 60219",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5!
                                          .copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF707070),
                                              fontSize: 12,
                                              fontFamily: "Quicksand")),
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
                            children: [
                              Text("Pesanan",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF1C9FE2),
                                          fontSize: 16,
                                          fontFamily: "Quicksand")),
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
                              children: [
                                Text("Rincian Pembayaran",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5!
                                        .copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF1C9FE2),
                                            fontSize: 16,
                                            fontFamily: "Quicksand")),
                              ],
                            ),
                            SizedBox(height: 10.0),
                            Card(
                              elevation: 0.0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  side: BorderSide(
                                      width: 1.4, color: Color(0xFFBFBFBF))),
                              child: Container(
                                padding: EdgeInsets.all(20),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Harga Makanan",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline5!
                                                .copyWith(
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontFamily: "Quicksand")),
                                        Text(
                                            "Rp${totalPriceFood(tempList).toString()}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline5!
                                                .copyWith(
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontFamily: "Quicksand")),
                                      ],
                                    ),
                                    SizedBox(height: 10.0),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Ongkos Kirim",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline5!
                                                .copyWith(
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontFamily: "Quicksand")),
                                        Text("Rp20.000",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline5!
                                                .copyWith(
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontFamily: "Quicksand")),
                                      ],
                                    ),
                                    SizedBox(height: 15.0),
                                    Divider(
                                        color: Colors.grey[400], height: 10),
                                    SizedBox(height: 15.0),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Total",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline5!
                                                .copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xFF1C9FE2),
                                                    fontSize: 16,
                                                    fontFamily: "Quicksand")),
                                        Text(
                                            "Rp${(totalPrice(totalPriceFood, 20000, tempList).toString())}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline5!
                                                .copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xFF1C9FE2),
                                                    fontSize: 16,
                                                    fontFamily: "Quicksand")),
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
