part of 'pages.dart';

class WebviewMidtransPage extends StatefulWidget {
  static const routeName = '/checkout_web';

  WebviewMidtransPage({
    super.key,
  });

  @override
  State<WebviewMidtransPage> createState() => _WebviewMidtransState();
}

class _WebviewMidtransState extends State<WebviewMidtransPage> {
  late PlanningViewModel planningViewModel;
  late CheckoutViewModel checkoutViewModel;
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  initState() {
    super.initState();
    planningViewModel = Provider.of<PlanningViewModel>(context, listen: false);
    checkoutViewModel = Provider.of<CheckoutViewModel>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context)!.settings.arguments as Map;
    List<Meal> tempList = data["tempListKeranjang"];

    // Call ViewModel function to redirect to payment gateaway webview
    Future<void> createOrder() async {
      var getPay = await checkoutViewModel.fetchCreateOrder(tempList);
      print('hello $getPay');
    }


    return Scaffold(
        body: WebView(
      initialUrl: data["snapUrl"],
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController webViewController) {
        _controller.complete(webViewController);
      },
      navigationDelegate: (NavigationRequest request) {
        if (request.url.startsWith(data["snapUrl"])) {
          // Prevent that url works
          // OPEN MIDTRANS WEB URL
          return NavigationDecision.prevent;
        } else if (request.url
            .contains("https://kukoki.com/checkout/unfinish")) {
          print("canceled");
          Navigator.pop(context, "Payment Failedd");

          return NavigationDecision.prevent;
        } else if (request.url.contains("https://kukoki.com/checkout/finish")) {
          String res = request.url;
          if (res.contains("transaction_status=settlement")) {
            print("Success");
            setState(() {
              createOrder();
              planningViewModel.orderList.insertAll(0, tempList);
              for (var item in tempList) {
                planningViewModel.cartList.removeWhere((element) => element == item);
              }
            });
            Navigator.pushReplacementNamed(
                context, SuccessfulPaymentPage.routeName, arguments: {
              "totalPembayaran": data["totalPembayaran"],
              "waktuTransaksi": DateTime.now()
            });
          } else if (res.contains("transaction_status=pending")) {
            print("PENDING");
            Navigator.pop(context, "Payment Failed");
          } else {
            print("ELSE");
            setState(() {
              planningViewModel.orderList.insertAll(0, tempList);
              for (var item in tempList) {
                planningViewModel.cartList.removeWhere((element) => element == item);
              }
            });
            Navigator.pushReplacementNamed(
                context, SuccessfulPaymentPage.routeName, arguments: {
              "totalPembayaran": data["totalPembayaran"],
              "waktuTransaksi": DateTime.now()
            });
          }

          return NavigationDecision.prevent;
        } else if (request.url.contains("https://kukoki.com/checkout/error")) {
          print("error");
          Navigator.pop(context, "Payment Failed");
          return NavigationDecision.prevent;
        }
        return NavigationDecision.navigate;
      },
    ));
  }
}
