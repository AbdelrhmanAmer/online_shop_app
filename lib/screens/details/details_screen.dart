import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_shop_app/constants.dart';
import 'package:online_shop_app/models/product.dart';

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
        appBar: AppBar(
          backgroundColor: product.color,
          foregroundColor: kTextLightColor,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            color: kTextLightColor,
            icon: SvgPicture.asset("assets/icons/back.svg",),
          ),
          actions: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
              child: GestureDetector(
                onTap: () {},
                child: SvgPicture.asset("assets/icons/search.svg"),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
              child: GestureDetector(
                onTap: () {},
                child: SvgPicture.asset("assets/icons/cart.svg"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
