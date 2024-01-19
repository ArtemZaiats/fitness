import 'package:fitness/models/category_model.dart';
import 'package:fitness/models/diet_model.dart';
import 'package:fitness/models/popular_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [];
  List<DietModel> diets = [];
  List<PopularDietModel> popularDiets = [];

  void _getInitialInfo() {
    categories = CategoryModel.getCategories();
    diets = DietModel.getDiets();
    popularDiets = PopularDietModel.getPopularDiets();
  }

  @override
  Widget build(BuildContext context) {
    _getInitialInfo();
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: ListView(children: [
        _searchField(),
        const SizedBox(height: 20),
        _categoriesSection(categories: categories),
        const SizedBox(height: 20),
        _dietSection(),
        const SizedBox(height: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Popular',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                )),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Container(
                      height: 100,
                      decoration: BoxDecoration(
                          color: popularDiets[index].boxIsSelected
                              ? Colors.white
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                                color:
                                    const Color(0xff1D1617).withOpacity(0.07),
                                offset: const Offset(0, 10),
                                blurRadius: 40,
                                spreadRadius: 0)
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SvgPicture.asset(
                            popularDiets[index].iconPath,
                            width: 56,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                popularDiets[index].name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    fontSize: 16),
                              ),
                              Text(
                                '${diets[index].level} | ${diets[index].duration} | ${diets[index].calorie}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff7B6F72),
                                    fontSize: 13),
                              ),
                            ],
                          ),
                          SvgPicture.asset(
                            'assets/icons/ic_arrow_right.svg',
                            width: 32,
                          ),
                        ],
                      ),
                    );
                  },
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => SizedBox(height: 24),
                  itemCount: popularDiets.length),
            )
          ],
        ),
        SizedBox(height: 20)
      ]),
    );
  }

  Column _dietSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text('Recommendation\nfor Diet',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600)),
        ),
        const SizedBox(height: 16),
        Container(
          height: 240,
          child: ListView.separated(
            itemBuilder: (context, index) {
              return Container(
                width: 210,
                decoration: BoxDecoration(
                    color: diets[index].boxColor.withOpacity(0.35),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset(
                      diets[index].iconPath,
                      width: 88,
                    ),
                    Text(
                      diets[index].name,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: 16),
                    ),
                    Text(
                      '${diets[index].level} | ${diets[index].duration} | ${diets[index].calorie}',
                      style: const TextStyle(
                          color: Color(0xff7B6F72),
                          fontSize: 13,
                          fontWeight: FontWeight.w400),
                    ),
                    Container(
                      height: 45,
                      width: 130,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            diets[index].viewIsSelected
                                ? Color(0xff9DCEFF)
                                : Colors.transparent,
                            diets[index].viewIsSelected
                                ? Color(0xff99A3FD)
                                : Colors.transparent
                          ]),
                          borderRadius: BorderRadius.circular(50)),
                      child: Center(
                        child: Text(
                          'View',
                          style: TextStyle(
                              color: diets[index].viewIsSelected
                                  ? Colors.white
                                  : Color(0xffC58BF2),
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(width: 24),
            itemCount: diets.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20, right: 20),
          ),
        )
      ],
    );
  }

  Container _searchField() {
    return Container(
      margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: const Color(0xff1D1617).withOpacity(0.11),
            blurRadius: 40,
            spreadRadius: 0.0)
      ]),
      child: TextField(
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.all(15),
            hintText: 'Search pancake',
            hintStyle: const TextStyle(color: Color(0xffDDDADA), fontSize: 14),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12),
              child: SvgPicture.asset('assets/icons/ic_search.svg',
                  height: 20, width: 20),
            ),
            suffixIcon: Container(
              width: 100,
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const VerticalDivider(
                      color: Colors.black,
                      indent: 10,
                      endIndent: 10,
                      thickness: 0.1,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: SvgPicture.asset(
                        'assets/icons/ic_filter.svg',
                        height: 20,
                        width: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none)),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text(
        'Breakfast',
        style: TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {},
        child: Container(
          margin: const EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: const Color(0xffF7F8F8),
              borderRadius: BorderRadius.circular(10)),
          child: SvgPicture.asset(
            'assets/icons/arrow_back_ic.svg',
            height: 20,
            width: 20,
          ),
        ),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.all(10),
          alignment: Alignment.center,
          width: 37,
          decoration: BoxDecoration(
              color: const Color(0xffF7F8F8),
              borderRadius: BorderRadius.circular(10)),
          child: SvgPicture.asset(
            'assets/icons/dots_more_vert.svg',
            height: 20,
            width: 20,
          ),
        ),
      ],
    );
  }
}

class _categoriesSection extends StatelessWidget {
  const _categoriesSection({
    super.key,
    required this.categories,
  });

  final List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Category',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(height: 16),
        Container(
          height: 150,
          child: ListView.separated(
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: 20, right: 20),
            separatorBuilder: (context, index) => SizedBox(
              width: 24,
            ),
            itemBuilder: (context, index) {
              return Container(
                width: 100,
                decoration: BoxDecoration(
                  color: categories[index].boxColor.withOpacity(0.35),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.asset(categories[index].iconPath),
                        ),
                      ),
                      Text(
                        categories[index].name,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 14),
                      )
                    ]),
              );
            },
          ),
        )
      ],
    );
  }
}
