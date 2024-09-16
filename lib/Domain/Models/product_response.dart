import 'package:flutter_task_cycle_one/Data/Models/product_response_dto.dart';
import 'package:flutter_task_cycle_one/Data/Models/product_rating.dart';

class ProductResponse {
  int? productID;
  String? productTitle;
  double? productPrice;
  String? productDescription;
  String? productCategory;
  String? productImage;
  double? productRating; // Expecting a simple double value for rate

  ProductResponse({
    this.productID,
    this.productTitle,
    this.productPrice,
    this.productDescription,
    this.productCategory,
    this.productImage,
    this.productRating,
  });

  ProductResponse.fromJson(Map<String, dynamic> json) {
    productID = json['id'];
    productTitle = json['title'];
    productPrice = (json['price'] as num?)?.toDouble();
    productDescription = json['description'];
    productCategory = json['category'];
    productImage = json['image'];

    if (json['rating'] != null && json['rating'] is Map<String, dynamic>) {
      var ratingMap = json['rating'] as Map<String, dynamic>;
      productRating = (ratingMap['rate'] as num?)?.toDouble(); // Extract rate only
    } else {
      productRating = null;
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = productID;
    map['title'] = productTitle;
    map['price'] = productPrice;
    map['description'] = productDescription;
    map['category'] = productCategory;
    map['image'] = productImage;
    map['rating'] = productRating; // Store rate only

    return map;
  }

  ProductResponseDTO toDataSource() {
    return ProductResponseDTO(
      productID: productID,
      productTitle: productTitle,
      productPrice: productPrice,
      productDescription: productDescription,
      productCategory: productCategory,
      productImage: productImage,
      productRating: productRating != null ? ProductRating(rate: productRating!, count: 0) : null, // Handle conversion
    );
  }
}
