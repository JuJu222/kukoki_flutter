import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kukoki_flutter/Adapters/MidtransAdapter.dart';
import 'package:kukoki_flutter/Models/CheckoutResponse.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../Models/Meal.dart';
import '../ViewModels/CheckoutViewModel.dart';
import 'SuccessfulPaymentPage.dart';

class WebviewMidtransPage extends StatefulWidget {
  static const routeName = '/checkout_web';

  WebviewMidtransPage({
    super.key,
  });

  @override
  State<WebviewMidtransPage> createState() => _WebviewMidtransState();
}

class _WebviewMidtransState extends State<WebviewMidtransPage> {
  late MidtransAdapter midtransAdapter = MidtransAdapter();
  late CheckoutViewModel checkoutViewModel;
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  initState() {
    super.initState();
    checkoutViewModel = Provider.of<CheckoutViewModel>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context)!.settings.arguments as Map;
    List<Meal> cart = data['temporaryCart'];

    Future<CheckoutResponse> url =
        midtransAdapter.checkout(data["totalPayment"], 1);

    return Scaffold(
        body: FutureBuilder(
      future: url,
      builder: (context, AsyncSnapshot<CheckoutResponse> snapshot) {
        if (snapshot.hasData) {
          return WebView(
            initialUrl: snapshot.data!.snapUrl.toString(),
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            },
            navigationDelegate: (NavigationRequest request) {
              // Open Midtrans Web
              if (request.url.startsWith(snapshot.data!.snapUrl.toString())) {
                return NavigationDecision.prevent;
              } else if (request.url
                  .contains('https://kukoki.com/checkout/unfinish')) {
                Navigator.pop(context, 'Payment Failedd');
                return NavigationDecision.prevent;
              } else if (request.url
                  .contains('https://kukoki.com/checkout/finish')) {
                String res = request.url;
                if (res.contains('transaction_status=settlement')) {
                  setState(() {
                    checkoutViewModel.createOrder(cart, 1);
                    checkoutViewModel.emptyCart();
                    cart = checkoutViewModel.getCartList();
                    for (var item in cart) {
                      checkoutViewModel
                          .getCartList()
                          .removeWhere((element) => element == item);
                    }
                  });
                  Navigator.pushReplacementNamed(
                      context, SuccessfulPaymentPage.routeName, arguments: {
                    'totalPayment': data['totalPayment'],
                    'transactionTime': DateTime.now()
                  });
                } else if (res.contains('transaction_status=pending')) {
                  Navigator.pop(context, 'Payment Failed');
                } else {
                  setState(() {
                    checkoutViewModel.createOrder(cart, 1);
                    checkoutViewModel.emptyCart();
                    cart = checkoutViewModel.getCartList();
                  });
                  Navigator.pushReplacementNamed(
                      context, SuccessfulPaymentPage.routeName, arguments: {
                    'totalPayment': data['totalPayment'],
                    'transactionTime': DateTime.now()
                  });
                }

                return NavigationDecision.prevent;
              } else if (request.url
                  .contains('https://kukoki.com/checkout/error')) {
                Navigator.pop(context, 'Payment Failed');
                return NavigationDecision.prevent;
              }
              return NavigationDecision.navigate;
            },
          );
        } else if (snapshot.hasError) {
          return Text("error");
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    ));
  }
}
