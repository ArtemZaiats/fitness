import 'package:flutter/material.dart';

class PopularDietModel {
  String name;
  String iconPath;
  Color boxColor;
  String level;
  String duration;
  String calorie;
  bool boxIsSelected;

  PopularDietModel(
      {required this.name,
      required this.iconPath,
      required this.boxColor,
      required this.level,
      required this.duration,
      required this.calorie,
      required this.boxIsSelected});

  static List<PopularDietModel> getPopularDiets() {
    List<PopularDietModel> diets = [];

    diets.add(PopularDietModel(
        name: 'Honey Pancake',
        iconPath: 'assets/icons/ic_honey_pancakes.svg',
        boxColor: const Color(0xff92A3FD),
        level: 'Easy',
        duration: '30mins',
        calorie: '180kCal',
        boxIsSelected: true));

    diets.add(PopularDietModel(
        name: 'Tasty Burger',
        iconPath: 'assets/icons/ic_burger.svg',
        boxColor: const Color(0xffC58BF2),
        level: 'Medium',
        duration: '60mins',
        calorie: '300kCal',
        boxIsSelected: false));

    diets.add(PopularDietModel(
        name: 'Margarita',
        iconPath: 'assets/icons/ic_margarita.svg',
        boxColor: const Color(0xff92A3FD),
        level: 'Easy',
        duration: '10mins',
        calorie: '100kCal',
        boxIsSelected: false));

    return diets;
  }
}
