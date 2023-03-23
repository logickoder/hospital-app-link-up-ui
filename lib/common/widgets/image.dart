import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HomePageImage extends StatelessWidget {
  final String image;
  final double size;

  const HomePageImage({
    Key? key,
    required this.image,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: CachedNetworkImage(
        imageUrl: image,
        height: size,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
