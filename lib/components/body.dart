import 'package:flutter/material.dart';
import 'package:online_shop_app/constants.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Text(
            "Women",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
