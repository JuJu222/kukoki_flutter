part of "pages.dart";

class CheckoutPage extends StatefulWidget {
  static const routeName = "Checkout";
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Hello")
    );
  }
}
