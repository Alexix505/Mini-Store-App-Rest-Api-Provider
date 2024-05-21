import 'package:flutter/material.dart';

import '../models/product_model.dart';
import '../services/api_handler.dart';
import '../widgets/feeds_grid.dart';
import '../widgets/feeds_widget.dart';

class FeedsScreen extends StatefulWidget {
  const FeedsScreen({super.key});

  @override
  State<FeedsScreen> createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen> {
  late final List<ProductsModel> productList;

  @override
  void didChangeDependencies() {
    getProducts();
    super.didChangeDependencies();
  }

  Future<void> getProducts() async {
    productList = await APIHandler.getAllProducts();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.black,
        elevation: 4,
        title: const Text('All Products'),
      ),
      body:
          // const FeedsGridWidget(
          //   productList: [],
          // ),
          productList.isEmpty
              ? Container()
              : GridView.builder(
                  shrinkWrap: true,
                  itemCount: productList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.6,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0,
                  ),
                  itemBuilder: (context, index) {
                    return FeedsWidget(
                      title: productList[index].title.toString(),
                      imageUrl: productList[index].images![0],
                    );
                  },
                ),
    );
  }
}
