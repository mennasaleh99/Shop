import 'package:flutter/material.dart';
import 'package:shop/provider/product.dart';
import 'package:provider/provider.dart';

class ADDEditScreen extends StatefulWidget {
  const ADDEditScreen({Key? key}) : super(key: key);

  @override
  _ADDEditScreenState createState() => _ADDEditScreenState();
}

class _ADDEditScreenState extends State<ADDEditScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController title = TextEditingController();
    TextEditingController price = TextEditingController();
    TextEditingController desc = TextEditingController();
    TextEditingController imgUrl = TextEditingController();

    var args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    Product product;
    if (args != null) {
      product = Provider.of<Products>(context).findById(args['id']);
      title.text = product.title;
      price.text = product.price.toString();
      desc.text = product.description;
      imgUrl.text = product.imgUrl;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[300],
        title: Text(args == null ? 'Add Product' : 'Edit Product'),
        actions: [
          IconButton(
              onPressed: () {
                args == null
                    ? Provider.of<Products>(context, listen: false).addProduct(
                        title: title.text,
                        price: double.parse(price.text),
                        description: desc.text,
                        imgUrl: imgUrl.text,
                        isfav: false)
                    : Provider.of<Products>(context, listen: false)
                        .updateProduct(
                        id: args['id'],
                        title: title.text,
                        price: double.parse(price.text),
                        description: desc.text,
                        imgUrl: imgUrl.text,
                      );
                Navigator.pop(context);
              },
              icon: Icon(Icons.save))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            TextField(
              controller: title,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Title',
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: price,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Price',
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: desc,
              maxLines: 3,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Description',
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: imgUrl,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Image URL',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
