import 'package:flutter/material.dart';

class RatingStars extends StatelessWidget {
  const RatingStars({
    required this.rating,
  });

  final int rating;

  @override
  Widget build(BuildContext context) {
    String stars = '';
    for (var i = 1; i <= rating; i++) {
      stars += '⭐  ';
    }
    return Text(
      stars.trim(),
      style: TextStyle(fontSize: 18),
    );
  }
}
