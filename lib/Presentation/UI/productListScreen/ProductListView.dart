import 'package:flutter/material.dart';
import 'package:flutter_task_cycle_one/Presentation/UI/productListScreen/widgets/ProductCard.dart';

class ProductListScreen extends StatefulWidget {
  static const String routeName = 'productScreen';

  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) => ProductCard(
                productImage: "Assets/Images/wallpaperflare.com_wallpaper (3).jpg",
                productPrice: 1.200,
                productRating: 4.6,
                productTitle: "Nike Air Jordan",
              ),
            ),
          )
        ],
      ),
    );
  }
}
