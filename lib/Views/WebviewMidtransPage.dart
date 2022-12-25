import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
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
    List<Meal> tempList = data['temporaryCart'];

    return Scaffold(
        body: WebView(
      initialUrl: data['snapUrl'],
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController webViewController) {
        _controller.complete(webViewController);
      },
      navigationDelegate: (NavigationRequest request) {
        // Open Midtrans Web
        if (request.url.startsWith(data['snapUrl'])) {
          return NavigationDecision.prevent;
        } else if (request.url
            .contains('https://kukoki.com/checkout/unfinish')) {
          Navigator.pop(context, 'Payment Failedd');
          return NavigationDecision.prevent;
        } else if (request.url.contains('https://kukoki.com/checkout/finish')) {
          String res = request.url;
          if (res.contains('transaction_status=settlement')) {
            setState(() {
              checkoutViewModel.createOrder(tempList);
              checkoutViewModel.emptyCart();
              tempList = checkoutViewModel.getCartList();
              for (var item in tempList) {
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
              checkoutViewModel.createOrder(tempList);
              checkoutViewModel.emptyCart();
              tempList = checkoutViewModel.getCartList();
            });
            Navigator.pushReplacementNamed(
                context, SuccessfulPaymentPage.routeName, arguments: {
              'totalPayment': data['totalPayment'],
              'transactionTime': DateTime.now()
            });
          }

          return NavigationDecision.prevent;
        } else if (request.url.contains('https://kukoki.com/checkout/error')) {
          Navigator.pop(context, 'Payment Failed');
          return NavigationDecision.prevent;
        }
        return NavigationDecision.navigate;
      },
    ));
  }
}
