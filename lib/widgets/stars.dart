import 'package:flutter/material.dart';

class Stars extends StatelessWidget {
  final bool view; // Whether to display the review count
  final double rating; // Rating value (e.g., 4.5)
  final int reviewCount; // Number of reviews
  final Color filledColor;
  final Color emptyColor;
  final double size;

  const Stars({
    super.key,
    this.view = true,
    required this.rating,
    this.reviewCount = 0, // Default 0 reviews
    this.filledColor = Colors.amber,
    this.emptyColor = Colors.grey,
    this.size = 24.0,
  });

  @override
  Widget build(BuildContext context) {
    int fullStars = rating.floor();
    bool hasHalfStar = (rating - fullStars) >= 0.5;
    int emptyStars = 5 - fullStars - (hasHalfStar ? 1 : 0);

    return Row(
      children: [
        for (int i = 0; i < fullStars; i++)
          Icon(Icons.star, color: filledColor, size: size),
        if (hasHalfStar)
          Icon(Icons.star_half, color: filledColor, size: size),
        for (int i = 0; i < emptyStars; i++)
          Icon(Icons.star_outline, color: emptyColor, size: size),
        if (view) const SizedBox(width: 8),
        if (view)
          Text(
            '$reviewCount reviews',
            style: const TextStyle(fontSize: 14),
          ),
      ],
    );
  }
}
