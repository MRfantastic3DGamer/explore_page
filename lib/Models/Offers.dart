import 'package:flutter/material.dart';

class Offer {
  final String id;
  final String title;
  final AssetImage image;
  final int offer;
  final AssetImage logo;
  final int price;

   const Offer({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.offer,
    required this.logo,
  });
}