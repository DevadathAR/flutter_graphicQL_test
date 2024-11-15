import 'package:flutter/material.dart';
import 'package:graphql_learning/constants/colors.dart';
import 'package:graphql_learning/constants/style.dart';

class PageShow extends StatelessWidget {
  const PageShow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          const Icon(Icons.home),
          Icon(Icons.arrow_forward_ios, color: AppColors.grey.withOpacity(0.5)),
          Text(
            'data',
            style: AppTextStyle.regularText(size: 12, color: AppColors.grey),
          ),
          Icon(Icons.arrow_forward_ios, color: AppColors.grey.withOpacity(0.5)),
          Text(
            'data',
            style: AppTextStyle.regularText(size: 12, color: AppColors.grey),
          ),
          Icon(Icons.arrow_forward_ios, color: AppColors.grey.withOpacity(0.5)),
          Text(
            'data',
            style: AppTextStyle.regularText(size: 12, color: AppColors.grey),
          ),
          Icon(Icons.arrow_forward_ios, color: AppColors.grey.withOpacity(0.5)),
        ],
      ),
    );
  }
}
