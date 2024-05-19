import 'package:flutter/material.dart';

import '../widgets/feeds_grid.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.black,
        elevation: 4,
        title: const Text('All Products'),
      ),
      body: const FeedsGridWidget(),
      // GridView.builder(
      //   shrinkWrap: true,
      //   itemCount: 4,
      //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //     crossAxisCount: 2,
      //     childAspectRatio: 0.6,
      //     crossAxisSpacing: 0,
      //     mainAxisSpacing: 0,
      //   ),
      //   itemBuilder: (context, index) {
      //     return const FeedsWidget();
      //   },
      // ),
    );
  }
}
