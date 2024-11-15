import 'package:flutter/material.dart';
import 'package:graphql_learning/widgets/itemDetailed.dart';
import 'package:graphql_learning/widgets/pageShow.dart';
import 'package:graphql_learning/widgets/singleItem.dart';

class IteamBox extends StatelessWidget {
  final ScrollPhysics scroll;
  final bool ispage;
  const IteamBox(
      {super.key,
      this.scroll = const BouncingScrollPhysics(),
      this.ispage = true});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (ispage) const PageShow(),
        Expanded(
          child: GridView.builder(
            physics: scroll,
            padding: const EdgeInsets.all(8.0),
            itemCount: 10,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 2 / 3,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const IteamDetailed();
                      },
                    ),
                  );
                },
                child: const SingleIteam(
                  isDetailed: false,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
