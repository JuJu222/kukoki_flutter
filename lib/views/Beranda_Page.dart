part of "pages.dart";

class BerandaPage extends StatefulWidget {
  static const routeName = "Beranda";
  const BerandaPage({super.key});

  @override
  State<BerandaPage> createState() => _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {
  int? countPendek = 0;
  int? countPanjang = 0;
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Hello"),
    );
  }
}
