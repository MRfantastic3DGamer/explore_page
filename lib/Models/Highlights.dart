import 'package:flutter/material.dart';

class Highlight {
  final String id;
  final String title;
  final AssetImage placeholder;
  final AssetImage image;

   const Highlight({
    required this.id,
    required this.title,
    required this.placeholder,
    required this.image,
  });
}