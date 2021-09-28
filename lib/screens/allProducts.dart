import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop/provider/product.dart';
import 'package:shop/widgets/product_tile.dart';
import 'package:provider/provider.dart';

class AllProducts extends StatefulWidget {
  AllProducts({Key? key}) : super(key: key);

  @override
  _AllProductsState createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  @override
  Widget build(BuildContext context) {
    List<Product> prods = Provider.of<Products>(context).getProduct;
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
          itemCount: prods.length,
          itemBuilder: (ctx, i) {
            return ProductTile(
                imgUrl: prods[i].imgUrl,
                title: prods[i].title,
                id: prods[i].id);
          }),
    );
  }
}
