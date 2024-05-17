import 'package:flutter/material.dart';

import '../widgets/category_widget.dart';
import '../widgets/feeds_widget.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.black,
        elevation: 4,
        title: const Text('Categories'),
      ),
      body: GridView.builder(
        shrinkWrap: true,
        itemCount: 4,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.6,
          crossAxisSpacing: 0,
          mainAxisSpacing: 1.2,
        ),
        itemBuilder: (context, index) {
          return const CategoryWidget();
        },
      ),
    );
  }
}
