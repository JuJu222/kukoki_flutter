part of 'pages.dart';

class HomePage extends StatefulWidget {
  static final routeName = "/HomePage";

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _bottomNavindex = 0;
  List<Widget> _listPageWidget = [
    CatalogPage(),
    PlanningPage(),
    OrderPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> _bottomNavBarItems = [
      BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/beranda.svg',
            color: _bottomNavindex == 0
                ? const Color(0xFF1C9FE2)
                : const Color(0xFFA9A9A9),
          ),
          label: MenuPage.routeName),
      BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/rencana.svg',
            color: _bottomNavindex == 1
                ? const Color(0xFF1C9FE2)
                : const Color(0xFFA9A9A9),
          ),
          label: PlanningPage.pageName),
      BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/pesanan.svg',
            color: _bottomNavindex == 2
                ? const Color(0xFF1C9FE2)
                : const Color(0xFFA9A9A9),
          ),
          label: OrderPage.pageName),
      BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/profil.svg',
            color: _bottomNavindex == 3
                ? const Color(0xFF1C9FE2)
                : const Color(0xFFA9A9A9),
          ),
          label: ProfilePage.pageName),
    ];

    return Scaffold(
      body: _listPageWidget[_bottomNavindex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12.0,
        unselectedFontSize: 11.0,
        selectedLabelStyle: const TextStyle(
            fontFamily: 'Quicksand', fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(
            fontFamily: 'Quicksand', fontWeight: FontWeight.bold),
        currentIndex: _bottomNavindex,
        items: _bottomNavBarItems,
        onTap: (selected) {
          setState(() {
            _bottomNavindex = selected;
          });
        },
      ),
    );
  }
}
