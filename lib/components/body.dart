import 'package:flutter/material.dart';
import 'package:online_shop_app/models/product.dart';
import 'categories.dart';
import '../constants.dart';

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
          // GridView.builder(
          //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //         crossAxisCount: 2, childAspectRatio: .75),
          //     itemCount: products.length,
          //     itemBuilder: (ctx, index) {
          //       return ItemCard(product: products[index], press: () {});
          //     }),
        ],
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    this.product,
    this.press,
  });
  final Product? product;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(kDefaultPadding),
          height: 180,
          width: 170,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: product?.color,
          ),
          child: Image.asset(product!.image),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 4),
          child: Text(
            product!.title,
            style: const TextStyle(color: kTextLightColor),
          ),
        ),
        Text(
          "\$${product?.price}",
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(fontWeight: FontWeight.w900),
        )
      ],
    );
  }
}
