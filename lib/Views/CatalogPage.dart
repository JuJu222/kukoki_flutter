import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CatalogPage extends StatefulWidget {
  static const routeName = 'Catalog';
  const CatalogPage({super.key});

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  int? shortCount = 0;
  int? longCount = 0;
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Hello'),
    );
  }
}
