import 'package:flutter/material.dart';
import 'package:online_shop_app/screens/details/details_screen.dart';
import 'package:online_shop_app/screens/home/components/item_card.dart';
import 'package:online_shop_app/models/product.dart';
import 'categories.dart';
import '../../../constants.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Women",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const Categories(),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: kDefaultPadding / 3),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: .7,
                  crossAxisSpacing: kDefaultPadding,
                  mainAxisSpacing: kDefaultPadding,
                ),
                itemCount: products.length,
                itemBuilder: (ctx, index) => ItemCard(
                  product: products[index],
                  press: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) =>
                            DetailsScreen(product: products[index]),
                      ),
                    ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
