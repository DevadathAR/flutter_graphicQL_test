import 'package:flutter/material.dart';
import 'package:graphql_learning/home.dart';
import 'package:graphql_learning/widgets/itemBox.dart';
import 'package:graphql_learning/widgets/pageShow.dart';
import 'package:graphql_learning/widgets/singleItem.dart';
import 'package:graphql_learning/widgets/stars.dart';

class IteamDetailed extends StatelessWidget {
  const IteamDetailed({super.key});

  @override
  Widget build(BuildContext context) {
    return Home(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            const PageShow(),
            // Add any other details or widgets here
            const Expanded(
                child: SingleIteam(
              isDetailed: true,
              length: 400,
            )),
            const Row(
              children: [
                Text('color : '),
                SizedBox(
                  width: 50,
                ),
                CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.blue,
                ),
                SizedBox(
                  width: 16,
                ),
                CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.green,
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                const Text('size  :'),
                const SizedBox(
                  width: 50,
                ),
                _sizecontainer(text: 'XS'),
                const SizedBox(
                  width: 16,
                ),
                _sizecontainer(text: 'S'),
                const SizedBox(
                  width: 16,
                ),
                _sizecontainer(text: 'M'),
                const SizedBox(
                  width: 16,
                ),
                _sizecontainer(text: 'L'),
                const SizedBox(
                  width: 16,
                ),
                _sizecontainer(text: "X"),
                const SizedBox(
                  width: 16,
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                const Text('Quantity : '),
                const SizedBox(
                  width: 20,
                ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                      height: 40,
                      width: 60,
                      child: const Center(
                        child: Text(
                          '1',
                          textAlign: TextAlign.center,
                        ),
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
                          Icon(
                            Icons.arrow_upward,
                            size: 15,
                          ),
                          Icon(
                            Icons.arrow_downward,
                            size: 15,
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _button(text: 'add cart'),
                _button(
                    color: const Color.fromARGB(255, 126, 126, 126),
                    text: 'buy'),
              ],
            ),
            _datum(datum: "Detailed", size: 22),
            _datum(color: Colors.black, size: 18, datum: '''
        Flutter is a powerful UI toolkit developed by Google for building natively compiled applications for mobile, web, and desktop from a single codebase. It leverages the Dart programming language and provides developers with a high-performance rendering engine that allows for smooth, high-fidelity applications. One of Flutter's standout features is its "hot reload," enabling real-time updates and rapid iteration, which greatly enhances productivity.
        
        A core component of Flutter is its widget-based architecture. Every element of a Flutter app—from layout structures to text, buttons, and animations—is a widget. These widgets are highly customizable and composable, enabling developers to create complex UIs efficiently. Flutter also supports both Material Design (for Android) and Cupertino (for iOS) widgets, ensuring a native-like experience across platforms.
        '''),
            _datum(datum: "Review", size: 18),
            const Row(
              children: [
                Text('data'),
                Stars(
                  view: false,
                )
              ],
            ),
            _datum(datum: 'great fit', size: 18, color: Colors.black),
            _datum(datum: 'great fit', size: 18, color: Colors.black),

            const Row(
              children: [
                Text('data'),
                Stars(
                  view: false,
                )
              ],
            ),
            _datum(datum: "data", size: 18, color: Colors.black),

            _datum(datum: "data", size: 16, color: Colors.black),
            _button(color: Colors.amber, height: 40),
            Center(child: _datum(datum: 'Product', size: 22)),

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

  Text _datum({datum, color = Colors.cyan, double? size}) => Text(
        datum,
        style: TextStyle(color: color, fontSize: size!),
      );

  Container _button(
      {color = Colors.cyan, double height = 30, String? text = 'data'}) {
    return Container(
      margin: const EdgeInsets.all(6),
      height: height,
      width: 150,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(15), color: color),
      alignment: Alignment.center,
      child: Text(text!),
    );
  }

  Container _sizecontainer({String? text}) => Container(
        height: 20,
        width: 30,
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child: Text(
          text!,
          textAlign: TextAlign.center,
        ),
      );
}
