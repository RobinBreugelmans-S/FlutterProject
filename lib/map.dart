import 'package:flutter/material.dart';
import 'package:flutter_application_1/product.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class ProductMap extends StatefulWidget {
  const ProductMap({super.key});

  @override
  State<ProductMap> createState() => ProductMapState();
}

class ProductMapState extends State<ProductMap> {
  //will be moved to FireBase
  var products = [
    Product("Lawnmower", 2500, LatLng(51.4, 4.5)),
    Product("Lawnmower 2", 3950, LatLng(51.487377, -3.192222)),
    Product("Lawnmower 3", 3950, LatLng(50.7543479, 6.0207718)),
    Product("Lawnmower 4", 3950, LatLng(38, 70)),
    Product("Lawnmower 5", 3950, LatLng(51.4484143, 4.8363272)),
    Product("Lawnmower 6", 3950, LatLng(49.6, 6.1)),
    Product("Lawnmower 7", 3950, LatLng(0, 0)),
    Product("Lawnmower 8", 3950, LatLng(49.9349926, 6.2028354)),
    Product("Lawnmower 9", 3950, LatLng(-83, 14)),
  ];

  List<Marker> markers = [];

  @override
  Widget build(BuildContext context) {
    for (var product in products) {
      markers.add(
        Marker(
          point: product.location,
          alignment: Alignment(-.3333, -1.5),
          child: MarkerIcon(product),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Map')),
      body: FlutterMap(
        options: const MapOptions(
          initialCenter: LatLng(51.35, 4.58),
          initialZoom: 7,
          interactionOptions: InteractionOptions(
            flags:
                InteractiveFlag.drag |
                InteractiveFlag.pinchZoom |
                InteractiveFlag.pinchMove,
          ),
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.app',
          ),
          MarkerLayer(markers: markers),
        ],
      ),
    );
  }
}

class MarkerIcon extends StatelessWidget {
  final Product product;

  const MarkerIcon(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        debugPrint(product.name);
        showDialog(
          context: context,
          builder: (context) {
            return const Icon(Icons.location_on, color: Colors.red, size: 120);
          },
        );
      },
      padding: EdgeInsets.zero,
      highlightColor: Colors.transparent,
      iconSize: 40,
      icon: const Icon(Icons.location_on, color: Colors.red),
    );
  }
}
