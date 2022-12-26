class Midtrans {
  late dynamic snapUrl;
  late dynamic totalPayment;
  late dynamic transactionTime;
  late dynamic temporaryCart;

  Midtrans({
    required this.snapUrl,
    required this.totalPayment,
    required this.transactionTime,
    required this.temporaryCart,
  });
  void render() {
    print("Rendering Square...");
  }
}
