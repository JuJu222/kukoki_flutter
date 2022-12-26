import 'dart:ui';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kukoki_flutter/Adapters/MidtransAdapter.dart';
import 'package:kukoki_flutter/ViewModels/CheckoutViewModel.dart';
import 'package:kukoki_flutter/Views/CatalogPage.dart';
import 'package:kukoki_flutter/Views/CheckoutPage.dart';
import 'package:kukoki_flutter/Views/HomePage.dart';
import 'package:kukoki_flutter/Views/ProfilePage.dart';
import 'package:kukoki_flutter/Views/SuccessfulPaymentPage.dart';
import 'package:kukoki_flutter/Views/WebviewMidtransPage.dart';
import 'package:provider/provider.dart';
import '../ViewModels/OrderViewModel.dart';

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
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: OrderViewModel()),
          ChangeNotifierProvider.value(value: CheckoutViewModel()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'MealKit',
          theme: ThemeData(
              //Pergantian Warna dan Text pada bar
              canvasColor: const Color(0xFFFFFFFF),
              colorScheme: Theme.of(context).colorScheme.copyWith(
                  primary: Color(0XFF1c9fe2),
                  onPrimary: Color(0XFF1C9FE2),
                  secondary: Color(0XFF1C9FE2)),
              appBarTheme: const AppBarTheme(
                  elevation: 0,
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.white,
                      statusBarIconBrightness: Brightness.dark))),
          initialRoute: HomePage.routeName,
          routes: {
            CatalogPage.routeName: (context) => const CatalogPage(),
            CheckoutPage.routeName: (context) => const CheckoutPage(),
            HomePage.routeName: (context) => HomePage(),
            ProfilePage.routeName: (context) => ProfilePage(),
            WebviewMidtransPage.routeName: (context) => WebviewMidtransPage(),
            SuccessfulPaymentPage.routeName: (context) =>
                SuccessfulPaymentPage()
          },
        ));
  }
}
