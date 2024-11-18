import 'package:flutter/material.dart';
import 'package:graphql_learning/pages/home.dart';
import 'package:graphql_learning/widgets/itemBox.dart';
import 'package:graphql_learning/widgets/pageShow.dart';
import 'package:graphql_learning/widgets/singleItem.dart';
import 'package:graphql_learning/widgets/stars.dart';

class IteamDetailed extends StatelessWidget {
  final Map<String, dynamic> product; // Changed from List<String> to Map
  const IteamDetailed({
    super.key,
    required this.product,
  });
  @override
  Widget build(BuildContext context) {
    final categories = product['categories'] ?? [];
    final reviews = product['reviews']?['items'] ?? []; // Extract reviews

    return Home(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            PageShow(categories: categories),
            _buildProductOverview(context), // Removed reviews
            _buildColorOptions(),
            const SizedBox(height: 8),
            _buildSizeOptions(),
            const SizedBox(height: 8),
            _buildQuantitySelector(),
            const SizedBox(height: 16),
            _buildActionButtons(),
            const SizedBox(height: 16),
            _datum(datum: "Detailed", size: 22),
            const SizedBox(height: 16),
            _datum(datum: "Reviews", size: 18),
            _buildReviews(reviews), // Pass reviews
            const SizedBox(height: 16),
            _button(color: Colors.amber, height: 40, text: 'Purchase Now'),
            Center(child: _datum(datum: 'Related Products', size: 22)),
            const SizedBox(
              height: 500,
              child: IteamBox(
                scroll: NeverScrollableScrollPhysics(),
                ispage: false,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductOverview(BuildContext context) {
    final name = product['name']?.toString() ?? 'Unnamed Product';
    final imageUrl = product['image']?['url'] ?? '';
    final reviewCount = product['review_count']??'';
    final price = (product['price_range']?['minimum_price']?['regular_price']
                ?['value'] as num?)
            ?.toStringAsFixed(2) ??
        '0.00';

    final ratingsBreakdown = product['reviews']?['items']
        ?.map((review) => review['ratings_breakdown'])
        ?.expand((ratingList) => ratingList is Iterable ? ratingList : [])
        ?.toList();

    double averageRating = 0.0;

    if (ratingsBreakdown != null && ratingsBreakdown.isNotEmpty) {
      final totalRatings = ratingsBreakdown.fold<double>(
        0.0,
        (double sum, dynamic rating) {
          final value = double.tryParse(rating['value'].toString()) ?? 0.0;
          return sum + value;
        },
      );
      averageRating = totalRatings / ratingsBreakdown.length;
    }

    return Column(
      children: [
        SingleItem(
          rating: averageRating,
          name: name,
          imageUrl: imageUrl,
          price: price,
          isDetailed: true,
          length: 400,
          reviewCount: reviewCount,
        ),
        // Stars(view: true, rating: averageRating,reviewCount: reviewCount), // Display star rating
      ],
    );
  }

  // Color Options
  Widget _buildColorOptions() {
    return const Row(
      children: [
        Text('Color: '),
        SizedBox(width: 50),
        CircleAvatar(radius: 12, backgroundColor: Colors.blue),
        SizedBox(width: 16),
        CircleAvatar(radius: 12, backgroundColor: Colors.green),
      ],
    );
  }

  // Size Options
  Widget _buildSizeOptions() {
    return Row(
      children: [
        const Text('Size:'),
        const SizedBox(width: 50),
        _sizeContainer(text: 'XS'),
        const SizedBox(width: 16),
        _sizeContainer(text: 'S'),
        const SizedBox(width: 16),
        _sizeContainer(text: 'M'),
        const SizedBox(width: 16),
        _sizeContainer(text: 'L'),
        const SizedBox(width: 16),
        _sizeContainer(text: 'XL'),
      ],
    );
  }

  // Quantity Selector
  Widget _buildQuantitySelector() {
    return Row(
      children: [
        const Text('Quantity: '),
        const SizedBox(width: 20),
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              height: 40,
              width: 60,
              child: const Center(
                child: Text('1', textAlign: TextAlign.center),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              height: 40,
              width: 60,
              child: const Column(
                children: [
                  Icon(Icons.arrow_upward, size: 15),
                  Icon(Icons.arrow_downward, size: 15),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Action Buttons
  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _button(text: 'Add to Cart'),
        _button(
            color: const Color.fromARGB(255, 126, 126, 126), text: 'Buy Now'),
      ],
    );
  }

  Widget _buildReviews(List<dynamic> reviews) {
    if (reviews.isEmpty) {
      return const Text(
        'No reviews available',
        style: TextStyle(fontSize: 16),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: reviews.map((review) {
        final nickname = review['nickname'] ?? 'Anonymous';
        final summary = review['summary'] ?? 'No summary provided';

        final ratingsBreakdown = product['reviews']?['items']
            ?.map((review) => review['ratings_breakdown'])
            ?.expand((ratingList) => ratingList is Iterable ? ratingList : [])
            ?.toList();

        double averageRating = 0.0;

        if (ratingsBreakdown != null && ratingsBreakdown.isNotEmpty) {
          final totalRatings = ratingsBreakdown.fold<double>(
            0.0,
            (double sum, dynamic rating) {
              final value = double.tryParse(rating['value'].toString()) ?? 0.0;
              return sum + value;
            },
          );
          averageRating = totalRatings / ratingsBreakdown.length;
        }

        print('Average rating $averageRating');

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nickname,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 4),
              Stars(view: false, rating: averageRating), // Use Stars widget
              const SizedBox(height: 4),
              Text(
                summary,
                style: const TextStyle(fontSize: 14),
              ),
              const Divider(),
            ],
          ),
        );
      }).toList(),
    );
  }

  // Custom Widgets
  Text _datum(
      {required String datum, Color color = Colors.cyan, double? size}) {
    return Text(
      datum,
      style: TextStyle(color: color, fontSize: size),
    );
  }

  Container _button({
    Color color = Colors.cyan,
    double height = 30,
    required String text,
  }) {
    return Container(
      margin: const EdgeInsets.all(6),
      height: height,
      width: 150,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(15), color: color),
      alignment: Alignment.center,
      child: Text(text),
    );
  }

  Container _sizeContainer({required String text}) {
    return Container(
      height: 20,
      width: 30,
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
