import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphql_learning/pages/itemDetailed.dart';
import 'package:graphql_learning/services/query.dart';
import 'package:graphql_learning/widgets/pageShow.dart';
import 'package:graphql_learning/widgets/singleItem.dart';

class IteamBox extends StatelessWidget {
  final ScrollPhysics scroll;
  final bool ispage;

  const IteamBox({
    super.key,
    this.scroll = const BouncingScrollPhysics(),
    this.ispage = true,
  });

  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(
        document: gql(getProductsQuery),
      ),
      builder: (QueryResult result,
          {VoidCallback? refetch, FetchMore? fetchMore}) {
        if (result.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (result.hasException) {
          return Center(
            child: Text('Error: ${result.exception.toString()}'),
          );
        }

        final products = result.data?['products']['items'] ?? [];

        final categories = products
            .map((product) => product['categories'] ?? [])
            .expand(
                (categoryList) => categoryList is Iterable ? categoryList : [])
            .toList();

        if (products.isEmpty) {
          return const Center(child: Text('No products found.'));
        }

        return Column(
          children: [
            if (ispage) PageShow(categories: categories),
            Expanded(
              child: GridView.builder(
                physics: scroll,
                padding: const EdgeInsets.all(8.0),
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 2 / 3,
                ),
                itemBuilder: (context, index) {
                  final product = products[index];
                  final name = product['name'] ?? 'Unnamed Product';
                  final imageUrl = product['image']?['url'] ?? '';
                  final reviewCount = product['review_count'] ?? '';
                  final price = (product['price_range']?['minimum_price']
                              ?['regular_price']?['value'] as num?)
                          ?.toStringAsFixed(2) ??
                      '0.00';
                  // Extract ratings_breakdown and calculate average rating
                  final ratingsBreakdown = product['reviews']?['items']
                      ?.map((review) => review['ratings_breakdown'])
                      ?.expand((ratingList) =>
                          ratingList is Iterable ? ratingList : [])
                      ?.toList();
                  double averageRating = 0.0;

                  if (ratingsBreakdown != null && ratingsBreakdown.isNotEmpty) {
                    final totalRatings = ratingsBreakdown.fold<double>(
                      0.0, // Initial value as a double
                      (double sum, dynamic rating) {
                        final value =
                            double.tryParse(rating['value'].toString()) ?? 0.0;
                        return sum + value;
                      },
                    );

                    averageRating = totalRatings / ratingsBreakdown.length;
                  }

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return IteamDetailed(
                              product: product,
                            );
                          },
                        ),
                      );
                    },
                    child: SingleItem(
                      reviewCount: reviewCount,
                      rating: averageRating,
                      isDetailed: false,
                      name: name,
                      imageUrl: imageUrl,
                      price: price,
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
