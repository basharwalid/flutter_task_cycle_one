import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  String productImage;
  String productTitle;
  double productPrice;
  double productRating;

  ProductCard(
      {super.key,
      required this.productImage,
      required this.productTitle,
      required this.productPrice,
      required this.productRating});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: const Color(0xffb7cbe0), width: 3),
                borderRadius: BorderRadius.circular(25)),
            child: Column(
              children: [
                ClipRRect(
                    child: Image.asset(productImage, fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(25),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            productTitle,
                            style: const TextStyle(
                              color: Color(0xff020047),
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "EGP $productPrice",
                            style: const TextStyle(
                              color: Color(0xff020047),
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            "Review",
                            style: TextStyle(
                              color: Color(0xff020047),
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "($productRating)",
                            style: const TextStyle(
                              color: Color(0xff020047),
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
