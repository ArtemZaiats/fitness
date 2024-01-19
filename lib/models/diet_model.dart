import 'package:flutter/material.dart';

class DietModel {
  String name;
  String iconPath;
  Color boxColor;
  String level;
  String duration;
  String calorie;
  bool viewIsSelected;

  DietModel(
      {required this.name,
      required this.iconPath,
      required this.boxColor,
      required this.level,
      required this.duration,
      required this.calorie,
      required this.viewIsSelected});

  static List<DietModel> getDiets() {
    List<DietModel> diets = [];

    diets.add(DietModel(
        name: 'Honey Pancake',
        iconPath: 'assets/icons/ic_honey_pancakes.svg',
        boxColor: const Color(0xff92A3FD),
        level: 'Easy',
        duration: '30mins',
        calorie: '180kCal',
        viewIsSelected: true));

    diets.add(DietModel(
        name: 'Tasty Burger',
        iconPath: 'assets/icons/ic_burger.svg',
        boxColor: const Color(0xffC58BF2),
        level: 'Medium',
        duration: '60mins',
        calorie: '300kCal',
        viewIsSelected: false));

    diets.add(DietModel(
        name: 'Margarita',
        iconPath: 'assets/icons/ic_margarita.svg',
        boxColor: const Color(0xff92A3FD),
        level: 'Easy',
        duration: '10mins',
        calorie: '100kCal',
        viewIsSelected: false));

    return diets;
  }
}
