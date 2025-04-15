import 'package:flutter/material.dart';

class Shop extends StatelessWidget {
  const Shop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
          title: const Text('My Home Page'),
        ),*/
      body: Center(
        child: Builder(
          builder: (context) {
            return Column(
              children: [
                const Text('Hello, World!'),
                const SizedBox(height: 20),
                const Text('Hello, World!'),
              ],
            );
          },
        ),
      ),
    );
  }
}
