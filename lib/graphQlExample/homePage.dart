// import 'package:empty_app/queries.dart';
// import 'package:flutter/material.dart';
// import 'package:graphql_flutter/graphql_flutter.dart';

// class Homepage extends StatelessWidget {
//   const Homepage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('GaphQlDemo'),
//       ),
//       body: Query(
//           options: QueryOptions(document: gql(getCountriesQuery)),
//           builder: (QueryResult result,
//               {Refetch? refetch, FetchMore? fetchMore}) {
//             if (result.isLoading) {
//               return const Center(child: CircularProgressIndicator());
//             }

//             if (result.hasException) {
//               return Center(
//                 child: Text('Error: ${result.exception.toString()}'),
//               );
//             }
//             final countries = result.data?['countries'] ?? [];

//             return ListView.builder(itemBuilder: (context, index) {
//               final country = countries[index];

//               return ListTile(
//                 leading: Text(country['emoji']),
//                 title: Text(country['name']),
//                 subtitle: Text(country['code']),
//               );
//             });
//           }),
//     );
//   }
// }