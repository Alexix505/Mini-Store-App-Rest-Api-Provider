import 'package:flutter/material.dart';

import '../models/product_model.dart';
import 'feeds_widget.dart';

class FeedsGridWidget extends StatelessWidget {
  const FeedsGridWidget({
    super.key,
    required this.productList,
  });
  final List<ProductsModel> productList;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 0.0,
            mainAxisSpacing: 0.0,
            childAspectRatio: 0.6),
        itemBuilder: (ctx, index) {
          return FeedsWidget(
            title: productList[index].title.toString(),
            imageUrl: productList[index].images![0],
          );
        });
  }
}
