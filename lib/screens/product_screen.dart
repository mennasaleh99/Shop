import 'package:flutter/material.dart';
import 'package:shop/provider/product.dart';
import 'package:shop/widgets/product_widget.dart';

class ProductScreen extends StatelessWidget {
  final List<Product> products;
  ProductScreen(this.products, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 350,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (ctx, i) {
          return ProductWidget(
            name: products[i].title,
            imgUrl: products[i].imgUrl,
            isFav: products[i].isFav,
          );
        },
      ),
    );
  }
}
