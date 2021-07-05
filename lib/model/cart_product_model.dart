class CartProductModel {
  String productId, name, image, price;
  int quantity;

  CartProductModel(
      {this.productId, this.name, this.image, this.price, this.quantity});

  CartProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    productId = map['product_id'];
    name = map['name'];
    image = map['image'];
    price = map['price'];
    quantity = map['quantity'];
  }

  toJson() {
    return {
      'product_id': productId,
      'name': name,
      'image': image,
      'price': price,
      'quantity': quantity,
    };
  }
}
