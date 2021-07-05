import 'package:ecommerce_app/core/constants.dart';
import 'package:ecommerce_app/core/viewmodel/cart_view_model.dart';
import 'package:ecommerce_app/model/cart_product_model.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:ecommerce_app/view/widgets/custom_button.dart';
import 'package:ecommerce_app/view/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsView extends StatelessWidget {
  ProductModel model;

  DetailsView({this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  child: Image.network(model.image,
                      fit: BoxFit.fill, colorBlendMode: BlendMode.dstATop)),
              SizedBox(height: 16),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomText(text: model.name, fontSize: 24),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width * .40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.grey)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CustomText(text: 'Size'),
                                CustomText(text: model.size),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            width: MediaQuery.of(context).size.width * .40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.grey)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CustomText(text: 'Color'),
                                Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color: model.color,
                                      borderRadius: BorderRadius.circular(4)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      CustomText(text: 'Details'),
                      SizedBox(height: 16),
                      CustomText(text: model.description, height: 2),
                    ],
                  ),
                ),
              ),
              Divider(color: Colors.grey[50]),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      CustomText(text: 'Price', fontSize: 18),
                      CustomText(
                          text: model.price + '\$',
                          color: primaryColor,
                          fontSize: 18),
                    ],
                  ),
                  GetBuilder<CartViewModel>(
                    init: CartViewModel(),
                    builder: (controller) => CustomButton(
                      text: 'Add',
                      onPressed: () {
                        controller.addProduct(CartProductModel(
                          productId: model.productId,
                          name: model.name,
                          image: model.image,
                          price: model.price,
                          quantity: 1,
                        ));
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
} // DetailView
