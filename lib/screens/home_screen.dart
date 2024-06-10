import 'package:flutter/material.dart';

import '../widgets/listcardfeed.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feed Card'),
        backgroundColor: Colors.green,
      ),
      body: const ListCardFeed(),
      // body: const Cardfeed(),
      backgroundColor: Colors.grey[300],
    );
  }
}
