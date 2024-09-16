import 'package:flutter/material.dart';
import 'package:flutter_task_cycle_one/Presentation/UI/productListScreen/product_list_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        ProductListView.routeName: (_) => const ProductListView(),
      },
      initialRoute: ProductListView.routeName,
    );
  }
}
