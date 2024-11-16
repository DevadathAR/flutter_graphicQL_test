import 'package:flutter/material.dart';
import 'package:graphql_learning/constants/colors.dart';
import 'package:graphql_learning/constants/style.dart';

class PageShow extends StatelessWidget {
  final List categories;

  const PageShow({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal, // Enable horizontal scrolling
        child: Row(
          children: [
            const Icon(Icons.home),
            ...categories.map(
              (category) => Row(
                children: [
                  Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.grey.withOpacity(0.5),
                  ),
                  Text(
                    category['name'] ?? 'Unnamed Category',
                    style: AppTextStyle.regularText(
                      size: 12,
                      color: AppColors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
