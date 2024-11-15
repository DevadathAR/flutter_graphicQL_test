import 'package:flutter/material.dart';

class Stars extends StatelessWidget {
  final bool? view;
  const Stars({
    super.key,
    this.view = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.star),
        const Icon(Icons.star),
        const Icon(Icons.star),
        const Icon(Icons.star),
        const Icon(Icons.star),
        const SizedBox(
          width: 100,
        ),
        if (view!) const Text('review')
      ],
    );
  }
}
