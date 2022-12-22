import 'package:flutter/material.dart';
import 'package:kukoki_flutter/Repositories/PaymentRepository.dart';
import 'package:kukoki_flutter/ViewModels/ViewModels.dart';
import 'package:kukoki_flutter/views/pages.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';

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
          ChangeNotifierProvider.value(value: PaymentViewModel()),
          ChangeNotifierProvider.value(value: PlanningViewModel()),
          ChangeNotifierProvider.value(value: CheckoutViewModel()),
        ],
        child: MaterialApp(
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
