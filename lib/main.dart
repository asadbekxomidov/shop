import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vazifalar/controllers/card_controller.dart';
import 'package:vazifalar/controllers/order_controller.dart';
import 'package:vazifalar/controllers/product_controller.dart';
import 'package:vazifalar/views/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductsController()),
        ChangeNotifierProvider(create: (_) => CartController()),
        ChangeNotifierProvider(create: (_) => OrderController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
