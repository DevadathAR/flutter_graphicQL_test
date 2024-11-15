import 'package:flutter/material.dart';
import 'package:graphql_learning/constants/imagePath.dart';
import 'package:graphql_learning/widgets/stars.dart';

class SingleIteam extends StatelessWidget {
  final bool isDetailed;
  final double? length;
  const SingleIteam({
    super.key,
    this.length,
    this.isDetailed = false,
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
                  shirt,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              const Text('data'),
              if (isDetailed) const Stars(),
              RichText(
                text: const TextSpan(
                  text: 'dollar ',
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: 'amount',
                      style: TextStyle(color: Colors.black),
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
                    child: const Text('data'),
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
