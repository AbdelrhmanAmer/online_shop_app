import 'package:flutter/material.dart';
import '../../../models/product.dart';
import '../../../constants.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    this.product,
    this.press,
  });
  final Product? product;
  final Function()? press;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: InkWell(
            onTap: press,
            child: Container(
              padding: const EdgeInsets.all(kDefaultPadding),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: product?.color,
              ),
              child: Image.asset(product!.image),
            ),
          ),
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
