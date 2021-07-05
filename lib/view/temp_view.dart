import 'package:ecommerce_app/core/constants.dart';
import 'package:ecommerce_app/core/viewmodel/home_view_model.dart';
import 'package:ecommerce_app/generated/assets.dart';
import 'package:ecommerce_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class TempView extends StatelessWidget {
  final List<String> names = <String>[
    'item1',
    'item2',
    'item3',
    'item4',
    'item5',
  ];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  _searchTextFormField(),
                  SizedBox(height: 20),
                  CustomText(text: 'Categories'),
                  SizedBox(height: 20),
                  _listViewCategory(),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(text: 'Best Selling', fontSize: 18),
                      CustomText(text: 'All', fontSize: 18),
                    ],
                  ),
                  SizedBox(height: 10),
                  _listViewProducts(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _searchTextFormField() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.grey.shade200),
      child: TextFormField(
        decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search, color: Colors.black)),
      ),
    );
  }

  Widget _listViewCategory() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
        height: 100,
        child: ListView.separated(
          itemCount: controller.categoryModel.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey.shade100),
                  height: 48,
                  width: 48,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(controller.categoryModel[index].image),
                  ),
                ),
                SizedBox(height: 10),
                CustomText(text: controller.categoryModel[index].name),
              ],
            );
          },
          separatorBuilder: (context, index) => SizedBox(width: 20),
        ),
      ),
    );
  }

  Widget _listViewProducts() {
    return Container(
      height: 350,
      child: ListView.separated(
        itemCount: names.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey.shade100),
                width: MediaQuery.of(context).size.width * .4,
                child: Container(
                    height: 220,
                    child: Image.asset(Assets.imagesHouse02, fit: BoxFit.fill)),
              ),
              CustomText(text: 'Title', fontSize: 20),
              SizedBox(width: 20),
              CustomText(text: 'Sub Title', color: Colors.grey),
              SizedBox(width: 20),
              CustomText(text: '\$250', color: primaryColor),
            ],
          );
        },
        separatorBuilder: (context, index) => SizedBox(width: 20),
      ),
    );
  }
}
