import 'package:ecommerce_app/core/constants.dart';
import 'package:ecommerce_app/core/viewmodel/cart_view_model.dart';
import 'package:ecommerce_app/view/widgets/custom_button.dart';
import 'package:ecommerce_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetBuilder<CartViewModel>(
                init: Get.find(),
                builder: (controller) => Container(
                  child: ListView.separated(
                    itemCount: controller.list.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 140,
                        child: Row(
                          children: [
                            Container(
                              width: 140,
                              child: Image.network(controller.list[index].image,
                                  fit: BoxFit.fill),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                    text: controller.list[index].name,
                                    fontSize: 18),
                                SizedBox(height: 10),
                                CustomText(
                                    text:
                                        '\$ ${controller.list[index].price.toString()}',
                                    fontSize: 14,
                                    color: primaryColor),
                                SizedBox(height: 10),
                                Container(
                                  width: 140,
                                  height: 40,
                                  color: Colors.grey.shade200,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      GestureDetector(
                                        child: Icon(Icons.add,
                                            color: Colors.black),
                                        onTap: () {
                                          controller.increaseQuantity(index);
                                        },
                                      ),
                                      CustomText(
                                          text: controller.list[index].quantity
                                              .toString(),
                                          fontSize: 20,
                                          color: Colors.black,
                                          alignment: Alignment.center),
                                      GestureDetector(
                                        child: Icon(Icons.remove,
                                            color: Colors.black),
                                        onTap: () {
                                          controller.decreaseQuantity(index);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider(height: 8, color: Colors.grey.shade100);
                    },
                  ),
                ),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      CustomText(
                        text: 'TOTAL',
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 15),
                      GetBuilder<CartViewModel>(
                        init: Get.find(),
                        builder: (controller) => CustomText(
                          text: '\$ ${controller.totalPrice}',
                          fontSize: 18,
                          color: primaryColor,
                        ),
                      ),
                    ],
                  ),
                  CustomButton(
                    onPressed: () {},
                    text: 'Checkout',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
