import 'package:flutter/material.dart';
import 'package:graphql_learning/constants/imagePath.dart';

class Home extends StatelessWidget {
  final Widget body;
  const Home({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CircleAvatar(
          backgroundImage: NetworkImage(M2),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15.0),
            child: Icon(Icons.menu),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.more), label: 'More'),
          BottomNavigationBarItem(icon: Icon(Icons.send), label: 'Send'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        onPressed: () {},
        child: Container(
          height: 35,
          width: 80,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: Colors.greenAccent,
          ),
          child: const Center(child: Text('FILTER')),
        ),
      ),
      body: body,
    );
  }
}
