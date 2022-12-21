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
  // String? url;
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context)!.settings.arguments as Map;
    List<Pesan> tempList = data["tempListKeranjang"];
    Uri basicUrl = Uri.parse("https://kukoki.com/login");
    return Scaffold(
        body: WebView(
      initialUrl: data["snapUrl"],
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController webViewController) {
        _controller.complete(webViewController);
      },
      navigationDelegate: (NavigationRequest request) {
        if (request.url.startsWith(data["snapUrl"])) {
          //Prevent that url works
          //OPEN MIDTRANS WEB URL
          return NavigationDecision.prevent;
        } else if (request.url
            //if the payment got canceled / time out
            .contains("https://kukoki.com/checkout/unfinish")) {
          print("canceled");
          Navigator.pop(context, "Payment Failedd");

          return NavigationDecision.prevent;
        } else if (request.url.contains("https://kukoki.com/checkout/finish")) {
          String res = request.url;
          //DEBUG PARSE THE URI LINK TO STRING
          print("Response :" + res);
          if (res.contains("transaction_status=settlement")) {
            // IF THE STRING CONTAINS SETTLEMENTS REDIRECT TO PEMBAYARAN BERHASIL PAGE
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
            // IF THE STRING CONTAINS PENDING REDIRECT TO PEMBAYARAN BERHASIL PAGE
            // THIS MEANS THE USER CLICKED THE BACK MERCHANT BUTTON BEFORE PAY AND TIMEOUT
            print("PENDING");
            Navigator.pop(context, "Payment Failed");
          } else {
            // IF THE STRING DOES NOT CONTAIN ANYTHING
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
        //Any other url works

        return NavigationDecision.navigate;
      },
    ));
  }
}
