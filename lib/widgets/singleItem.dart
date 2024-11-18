import 'package:flutter/material.dart';
import 'package:graphql_learning/constants/colors.dart';
import 'package:graphql_learning/constants/imagePath.dart';
import 'package:graphql_learning/constants/style.dart';
import 'package:graphql_learning/widgets/stars.dart';

class SingleItem extends StatelessWidget {
  final bool isDetailed;
  final double? length;
  final String name;
  final String imageUrl;
  final String price;
  final double rating; 
  final int reviewCount;// Rating value (e.g., 4.5)

  const SingleItem({
    super.key,
    this.length,
    this.isDetailed = false,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.rating, required this.reviewCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: length,
      decoration: BoxDecoration(
        border: isDetailed ? null : Border.all(color: Colors.black45),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.fitHeight,
                  width: double.infinity,
                ),
              ),
              Text(name),
              if (isDetailed) Stars(rating: rating,reviewCount: reviewCount,),
              RichText(
                text: TextSpan(
                  text: 'Rs  ',
                  style: const TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: price,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
              if (!isDetailed)
                Center(
                  child: Container(
                    margin: const EdgeInsets.all(6),
                    height: 28,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.cyan,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "ADD TO CART",
                      style: AppTextStyle.regularText(
                          size: 10, color: AppColors.white),
                    ),
                  ),
                ),
            ],
          ),
          const Positioned(
              top: 8,
              right: 8,
              child: Icon(
                Icons.favorite,
                color: Colors.black,
              ))
        ],
      ),
    );
  }


}
