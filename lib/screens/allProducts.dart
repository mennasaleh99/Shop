import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop/provider/product.dart';
import 'package:shop/widgets/product_tile.dart';

class AllProducts extends StatefulWidget {
  final List<Product> prods;
  AllProducts({required this.prods, Key? key}) : super(key: key);

  @override
  _AllProductsState createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[300],
        title: Text("My Products"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/AddEdit');
              },
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ))
        ],
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: widget.prods.length,
          itemBuilder: (ctx, i) {
            return ProductTile(
                imgUrl: widget.prods[i].imgUrl,
                title: widget.prods[i].title,
                id: widget.prods[i].id);
          }),
    );
  }
}
