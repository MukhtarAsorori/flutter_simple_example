import 'package:ecommerce_app/core/helper/extension.dart';
import 'package:flutter/material.dart';

class ProductModel {
  String productId, name, image, description, size, price;
  Color color;

  ProductModel(
      {this.name, this.image, this.description, this.size, this.price});

  ProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    productId = map['product_id'];
    name = map['name'];
    image = map['image'];
    description = map['description'];
    color = HexColor.fromHex(map['color']);
    size = map['size'];
    price = map['price'];
  }

  toJson() {
    return {
      'product_id': productId,
      'name': name,
      'image': image,
      'description': description,
      'color': color.toHex(),
      'size': size,
      'price': price,
    };
  }
}
