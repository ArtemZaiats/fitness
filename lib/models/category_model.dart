import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  String iconPath;
  Color boxColor;

  CategoryModel(
      {required this.name, required this.iconPath, required this.boxColor});

  static List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [];

    categories.add(CategoryModel(
        name: 'Salad',
        iconPath: 'assets/icons/ic_salad.svg',
        boxColor: const Color(0xff92A3FD)));

    categories.add(CategoryModel(
        name: 'Cake',
        iconPath: 'assets/icons/ic_pancake.svg',
        boxColor: const Color(0xffC58BF2)));

    categories.add(CategoryModel(
        name: 'Pie',
        iconPath: 'assets/icons/ic_pie.svg',
        boxColor: const Color(0xff92A3FD)));

    categories.add(CategoryModel(
        name: 'Smoothies',
        iconPath: 'assets/icons/ic_smoothie.svg',
        boxColor: const Color(0xffC58BF2)));

    return categories;
  }
}
