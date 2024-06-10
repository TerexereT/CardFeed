import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({super.key, required this.image});

  final String image;
  @override
  Widget build(BuildContext context) {
    return Image.network(
        width: double.infinity, height: 200, fit: BoxFit.none, image);
  }
}
