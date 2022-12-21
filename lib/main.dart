import 'package:flutter/material.dart';
import 'package:kukoki_flutter/models/Resep.dart';
import 'package:kukoki_flutter/views/pages.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MealKit',
      theme: ThemeData(
          //Pergantian Warna dan Text pada bar
          canvasColor: const Color(0xFFFFFFFF),
          colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: primaryColor,
              onPrimary: secondaryColor,
              secondary: secondaryColor),
          appBarTheme: const AppBarTheme(
              elevation: 0,
              systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark)),
          textTheme: myTextTheme),
      initialRoute: HomePage.routeName,
      routes: {
        BerandaPage.routeName: (context) => const BerandaPage(),
        CheckoutPage.routeName: (context) => const CheckoutPage(),
        HomePage.routeName: (context) => HomePage(),
        ProfilePage.routeName: (context) => ProfilePage(),
        WebviewMidtrans.routeName: (context) => WebviewMidtrans(),
        PembayaranBerhasil.routeName: (context) => PembayaranBerhasil()
      },
    );
  }
}
