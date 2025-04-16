import 'package:flutter/material.dart';
import 'package:flutter_application_1/map.dart';
import 'package:flutter_application_1/product.dart';
import 'package:latlong2/latlong.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Shop'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

  /*void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[ProductList(products)],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, page(const ProductMap()));
        },
        //tooltip: 'Increment',
        child: const Icon(Icons.map),
      ),
    );
  }
}

MaterialPageRoute page(Widget page) {
  return MaterialPageRoute(
    builder: (context) {
      return page;
    },
  );
}
