// Component: Abstract base class for both leaf and composite elements
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_ui/ImageSlider/carousel.dart';


void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){

    return const MaterialApp(
      home: CarouselImageSlider(),
      
    );
  }
}