import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_shop_app/screens/home/components/body.dart';
import 'package:online_shop_app/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: const Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: SvgPicture.asset(
          "assets/icons/back.svg",
        ),
        onPressed: () {},
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            "assets/icons/search.svg",
            colorFilter: const ColorFilter.mode(kTextColor, BlendMode.srcIn),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            "assets/icons/cart.svg",
            colorFilter: const ColorFilter.mode(kTextColor, BlendMode.srcIn),
          ),
        ),
        const SizedBox(width: kDefaultPadding / 2)
      ],
    );
  }
}
