import 'package:flutter/material.dart';

class Product {
  String name;
  int price;
  Product(this.name, this.price);
}

class ProductContainer extends StatelessWidget {
  final Product product;

  const ProductContainer(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      margin: const EdgeInsets.all(8),
      color: const Color.fromARGB(255, 203, 203, 203),
      child: Column(
        children: [Text(product.name), Text(product.price.toString())],
      ),
    );
  }
}

class ProductList extends ListView {
  final List<Product> products;

  ProductList(this.products, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: LimitedBox(
        maxHeight: 600,
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (BuildContext context, int index) {
            return ProductContainer(products[index]);
          },
        ),
      ),
    );
  }
}
