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


    return Home(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            PageShow(categories: categories),
            _buildProductOverview(context),
            _buildColorOptions(),
            const SizedBox(height: 8),
            _buildSizeOptions(),
            const SizedBox(height: 8),
            _buildQuantitySelector(),
            const SizedBox(height: 16),
            _buildActionButtons(),
            const SizedBox(height: 16),
            _datum(datum: "Detailed", size: 22),
            _datum(
              color: Colors.black,
              size: 18,
              datum: '''
        Flutter is a powerful UI toolkit developed by Google for building natively compiled applications for mobile, web, and desktop from a single codebase. It leverages the Dart programming language and provides developers with a high-performance rendering engine that allows for smooth, high-fidelity applications. One of Flutter's standout features is its "hot reload," enabling real-time updates and rapid iteration, which greatly enhances productivity.
        
        A core component of Flutter is its widget-based architecture. Every element of a Flutter app—from layout structures to text, buttons, and animations—is a widget. These widgets are highly customizable and composable, enabling developers to create complex UIs efficiently. Flutter also supports both Material Design (for Android) and Cupertino (for iOS) widgets, ensuring a native-like experience across platforms.
        ''',
            ),
            const SizedBox(height: 16),
            _datum(datum: "Review", size: 18),
            _buildReviews(),
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
    final price = product['price']?.toString() ?? '0.00';

    return Column(
      children: [
        SingleItem(
          name: name,
          imageUrl: imageUrl,
          price: price,
          isDetailed: true,
          length: 400,
        ),
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

  // Reviews Section
  Widget _buildReviews() {
    return Column(
      children: [
        const Row(
          children: [
            Text('Great Fit'),
            Stars(view: false),
          ],
        ),
        _datum(datum: 'Great Quality', size: 18, color: Colors.black),
        _datum(datum: 'Highly Recommended', size: 18, color: Colors.black),
        const Row(
          children: [
            Text('Another Review'),
            Stars(view: false),
          ],
        ),
      ],
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
