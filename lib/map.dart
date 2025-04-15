import 'package:flutter/material.dart';

class ProductMap extends StatelessWidget {
  const ProductMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Map')),
      body: Center(child: const Text('OSM map here')),
    );
  }
}
