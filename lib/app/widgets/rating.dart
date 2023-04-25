import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  final double rating;

  const Rating({Key? key, required this.rating}) : super(key: key);

  static const stars = 5;

  static const filledColor = Color(0xFFD49432);
  static const filledStar = Icon(Icons.star, color: filledColor, size: 12);
  static const emptyStar = Icon(
    Icons.star,
    size: 12,
    color: Color(0xFFD9D9D9),
  );

  @override
  Widget build(BuildContext context) {
    final fullStars = rating.floor();
    final halfFilledStar = rating - fullStars;
    final emptyStars =
        halfFilledStar == 0 ? stars - fullStars : stars - fullStars - 1;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...List.generate(fullStars, (index) => filledStar),
        if (halfFilledStar != 0)
          ShaderMask(
            blendMode: BlendMode.srcATop,
            shaderCallback: (Rect rect) {
              return LinearGradient(
                stops: [0, halfFilledStar, halfFilledStar],
                colors: [filledColor, filledColor, filledColor.withOpacity(0)],
              ).createShader(rect);
            },
            child: emptyStar,
          ),
        ...List.generate(emptyStars, (index) => emptyStar),
      ],
    );
  }
}
