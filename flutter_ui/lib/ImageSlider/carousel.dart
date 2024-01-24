import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselImageSlider extends StatefulWidget {
  const CarouselImageSlider({super.key});

  @override
  State<CarouselImageSlider> createState() => _CarouselImageSliderState();
}

class _CarouselImageSliderState extends State<CarouselImageSlider> {
  final GlobalKey<ScaffoldState> _x = GlobalKey<ScaffoldState>();

  List images = [
    'assets/images/s1.jpg',
    'assets/images/s2.jpg',
    'assets/images/s3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _x,
      appBar: AppBar(
        title: const Text("Carousel Image Slider"),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.primaryContainer,
      ), body: ListView(
      children: [
        const SizedBox(height: 30,) ,
        const Text(
          "Slider 1: Initial Page Index 0\n\n",
          textAlign: TextAlign.center,
        ),
        CarouselSlider(
            items: images.map((imageUrl){
              return Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Image.asset(imageUrl, fit: BoxFit.fill,),
              );
            }).toList(),
            options: CarouselOptions(
              height: 186,
              initialPage: 2,

            )
        ),
      ],
    ),
    );
  }
}
