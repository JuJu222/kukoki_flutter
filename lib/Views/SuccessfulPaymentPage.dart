import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'HomePage.dart';

class SuccessfulPaymentPage extends StatelessWidget {
  static const routeName = '/SuccessfulPaymentPage';

  const SuccessfulPaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(children: [
          Container(
            margin: const EdgeInsets.only(top: 60),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.25,
            child: LottieBuilder.asset(
              'assets/lottie/payment_complete2.json',
              repeat: false,
              delegates: LottieDelegates(),
            ),
          ),
          Container(
            width: double.infinity,
            child: Column(children: [
              Text('Pembayaran Berhasil',
                  style: TextStyle(
                      color: Color(0XFF1c9fe2),
                      letterSpacing: 0.15,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      fontFamily: 'Quicksand')),
              SizedBox(
                height: 12,
              ),
              Text(
                '${data['waktuTransaksi'].day} November ${data['waktuTransaksi'].year}, ${data['waktuTransaksi'].hour}:${data['waktuTransaksi'].minute}',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.1,
                    fontFamily: 'Quicksand'),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                child: Column(children: [
                  Text(
                    'Total',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.15,
                        fontFamily: 'Quicksand'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 40,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              flex: 2,
                              child: Container(
                                  child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'Rp.',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'Quicksand',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ],
                              ))),
                          Expanded(
                              flex: 3,
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                child: Text(
                                  '${data['totalPembayaran']}',
                                  style: TextStyle(
                                      fontSize: 32,
                                      fontFamily: 'Quicksand',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ))
                        ]),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Container(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 9,
                            child: SvgPicture.asset(
                              'assets/images/payments/ovo_logo.svg',
                              width: 29,
                              height: 9,
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            '0812*****8901',
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Quicksand',
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          )
                        ]),
                  ),
                  SizedBox(height: 15.0),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          backgroundColor: Color(0XFF1c9fe2),
                          padding: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 10.0)),
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, HomePage.routeName, (route) => false);
                      },
                      child: Text('Ok',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              letterSpacing: 0.15,
                              fontFamily: 'Quicksand')))
                ]),
              )
            ]),
          )
        ]),
      ),
    );
  }
}
