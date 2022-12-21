part of 'pages.dart';

class WebviewMidtrans extends StatefulWidget {
  static const routeName = '/checkout_web';

  WebviewMidtrans({
    super.key,
  });

  @override
  State<WebviewMidtrans> createState() => _WebviewMidtransState();
}

class _WebviewMidtransState extends State<WebviewMidtrans> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context)!.settings.arguments as Map;
    List<Pesan> tempList = data["tempListKeranjang"];
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
              listPesan.insertAll(0, tempList);
              for (var item in tempList) {
                listKeranjang.removeWhere((element) => element == item);
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
              listPesan.insertAll(0, tempList);
              for (var item in tempList) {
                listKeranjang.removeWhere((element) => element == item);
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
