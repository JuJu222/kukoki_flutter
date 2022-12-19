part of 'pages.dart';

class ProfilePage extends StatefulWidget {
  static const pageName = "Profil";
  static final routeName = "/ProfilePage";

  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Hello")
    );
  }
}
