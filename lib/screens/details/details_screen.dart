import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_shop_app/constants.dart';
import 'package:online_shop_app/models/product.dart';
import 'package:online_shop_app/screens/details/components/body.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    super.key,
    required this.product,
  });

  final Product product;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: product.color,
        appBar: buildAppBar(context),
        body: Body(product: product,)
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
        backgroundColor: product.color,
        foregroundColor: kTextLightColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          color: kTextLightColor,
          icon: SvgPicture.asset(
            "assets/icons/back.svg",
            colorFilter:
                const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {  },
            icon: SvgPicture.asset(
              "assets/icons/search.svg",
            ),
          ),
          IconButton(
            onPressed: () {  },
            icon: SvgPicture.asset(
              "assets/icons/cart.svg",
            ),
          ),
          const SizedBox(width: kDefaultPadding/2,)
        ],
      );
  }
}
