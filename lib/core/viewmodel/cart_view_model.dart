import 'package:ecommerce_app/core/services/local/cart_helper.dart';
import 'package:ecommerce_app/model/cart_product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController {
  ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;

  List<CartProductModel> _list = [];
  List<CartProductModel> get list => _list;

  double _totalPrice = 0.0;
  double get totalPrice => _totalPrice;

  var dbHelper = CartDbHelper.db;

  CartViewModel() {
    getAllProduct();
  }

  addProduct(CartProductModel model) async {
    /*for (int i = 0; i < _list.length; i++) {
      if (_list[i].productId == model.productId) {
        return;
      }
      var dbHelper = CartDbHelper.db;
      await dbHelper.insert(model);
      _list.add(model);
    }*/
    var dbHelper = CartDbHelper.db;
    await dbHelper.insert(model);
    calcTotal(model);
    getTotalPrice();
    update();
    print('saved to sqlite db');
  }

  getAllProduct() async {
    _loading.value = true;
    _list = await dbHelper.getList();
    _loading.value = false;
    print('list: ${_list.length}');
    update();
  }

  getTotalPrice() {
    for (int i = 0; i < _list.length; i++) {
      calcTotal(_list[i]);
    }
    update();
  }

  increaseQuantity(int index) async {
    _list[index].quantity++;
    await dbHelper.updateProduct(_list[index]);
    _totalPrice += double.parse(_list[index].price);
    update();
  }

  decreaseQuantity(int index) async {
    _list[index].quantity--;
    await dbHelper.updateProduct(_list[index]);
    _totalPrice -= double.parse(_list[index].price);
    update();
  }

  calcTotal(CartProductModel model) {
    _totalPrice += (double.parse(model.price) * model.quantity);
  }
}
