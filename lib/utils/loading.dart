import "package:flutter/material.dart";
import 'package:flutter_spinkit/flutter_spinkit.dart';

//loading is like it's own page so it has to be stateless widget
class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF1C9FE2),
      child: const Center(
        child: SpinKitChasingDots(
          color: Colors.white,
          size: 50.0,
        )
      )
    );
  }
}