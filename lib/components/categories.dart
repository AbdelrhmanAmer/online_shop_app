import 'package:flutter/material.dart';
import '../constants.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = ["Hand bag", "Jewellery", "Footwear", "Dresses", "Technology"];
  // default
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (ctx, index) => buildCategory(index, context)),
    );
  }

  Widget buildCategory(int index, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: kDefaultPadding, top: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            hoverColor: null,
            child: Text(
              categories[index],
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color:
                        selectedIndex == index ? kTextColor : kTextLightColor,
                  ),
            ),
          ),
          Container(
              margin: const EdgeInsets.only(top: kDefaultPadding / 4),
              height: 3,
              width: 40,
              color: selectedIndex == index ? Colors.black : Colors.transparent)
        ],
      ),
    );
  }
}
