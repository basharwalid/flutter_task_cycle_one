import 'package:flutter_task_cycle_one/Data/Models/product_rating.dart';
import 'package:flutter_task_cycle_one/Domain/Models/product_response.dart';

class ProductResponseDTO {
  int? productID;
  String? productTitle;
  double? productPrice;
  String? productDescription;
  String? productCategory;
  String? productImage;
  ProductRating? productRating; // Use ProductRating class

  ProductResponseDTO({
    this.productID,
    this.productTitle,
    this.productPrice,
    this.productDescription,
    this.productCategory,
    this.productImage,
    this.productRating,
  });

  // Constructor that initializes the class from JSON
  ProductResponseDTO.fromJson(Map<String, dynamic> json) {
    productID = json['id'];
    productTitle = json['title'];
    productPrice = (json['price'] as num?)?.toDouble();
    productDescription = json['description'];
    productCategory = json['category'];
    productImage = json['image'];

    if (json['rating'] != null && json['rating'] is Map<String, dynamic>) {
      productRating = ProductRating.fromJson(json['rating'] as Map<String, dynamic>);
    } else {
      productRating = null;
    }
  }

  // Convert the class to a JSON object
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = productID;
    map['title'] = productTitle;
    map['price'] = productPrice;
    map['description'] = productDescription;
    map['category'] = productCategory;
    map['image'] = productImage;
    map['rating'] = productRating?.toJson(); // Convert ProductRating to JSON

    return map;
  }

  // Convert to domain model
  ProductResponse toDomain() {
    return ProductResponse(
      productID: productID,
      productTitle: productTitle,
      productPrice: productPrice,
      productDescription: productDescription,
      productCategory: productCategory,
      productImage: productImage,
      productRating: productRating?.rate, // Convert ProductRating to double
    );
  }
}
