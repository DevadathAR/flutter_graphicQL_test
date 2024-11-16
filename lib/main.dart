import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphql_learning/pages/home.dart';
import 'package:graphql_learning/services/graphqlClient.dart';
import 'package:graphql_learning/services/query.dart';
import 'package:graphql_learning/widgets/itemBox.dart';

void main() {
 
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: getGraphQLClient(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(body: IteamBox()),
      ),
    );
  }
}
