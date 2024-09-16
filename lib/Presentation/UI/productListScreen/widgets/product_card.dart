import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class ProductCard extends StatefulWidget {
  final String productImage;
  final String productTitle;
  final double productPrice;
  final double productRating;

  ProductCard({
    super.key,
    required this.productImage,
    required this.productTitle,
    required this.productPrice,
    required this.productRating,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xffb7cbe0), width: 3),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25),
                      topLeft: Radius.circular(25),
                    ),
                  ),
                  height: 130,
                  // Set height for the image container
                  width: double.infinity,
                  child: CachedNetworkImage(
                    imageUrl: widget.productImage,
                    fit: BoxFit.contain,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.productTitle,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Color(0xff020047),
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "EGP ${widget.productPrice}",
                          style: const TextStyle(
                            color: Color(0xff020047),
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            const Text(
                              "Review",
                              style: TextStyle(
                                color: Color(0xff020047),
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              "(${widget.productRating})",
                              style: const TextStyle(
                                color: Color(0xff020047),
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          //this button is only for decoration that's why setState is used,
          // when in release more professional way is implemented
          IconButton(
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
            icon: isFavorite
                ? const Icon(
                    Bootstrap.heart_fill,
                    color: Colors.red,
                  )
                : const Icon(
                    Bootstrap.heart,
                    color: Colors.red,
                  ),
          ),
        ],
      ),
    );
  }
}
