import 'package:flutter/material.dart';
import 'package:flutter_task_cycle_one/Domain/Models/ProductResponse.dart';

class ProductResponseDTO {
  String? productID;
  String? productTitle;
  double? productPrice;
  String? productDescription;
  String? productCategory;
  String? productImage;
  double? productRating;

  ProductResponseDTO({this.productID,
    this.productTitle,
    this.productPrice,
    this.productDescription,
    this.productCategory,
    this.productImage,
    this.productRating});

  ProductResponseDTO.fromJson(dynamic json){
    productID = json['id'];
    productTitle = json['title'];
    productPrice = json['price'];
    productDescription = json['description'];
    productCategory = json['category'];
    productImage = json['image'];
    productRating = json['rating'];
  }

  Map<String, dynamic> toJson(){
    final map = <String , dynamic>{};
    map['id'] = productID;
    map['title'] = productTitle;
    map['price'] = productPrice;
    map['description'] = productDescription;
    map['category'] = productCategory;
    map['image'] = productImage;
    map['rating'] = productRating;
    return map;
  }
  ProductResponse toDomain() {
    return ProductResponse(
        productID: productID,
        productTitle: productTitle,
        productPrice: productPrice,
        productDescription: productDescription,
        productCategory: productCategory,
        productImage: productImage,
        productRating: productRating);
  }
}
