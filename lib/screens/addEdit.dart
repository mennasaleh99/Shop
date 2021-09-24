import 'package:flutter/material.dart';

class ADD_EditScreen extends StatefulWidget {
  const ADD_EditScreen({Key? key}) : super(key: key);

  @override
  _ADD_EditScreenState createState() => _ADD_EditScreenState();
}

class _ADD_EditScreenState extends State<ADD_EditScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController title = TextEditingController();
    TextEditingController price = TextEditingController();
    TextEditingController desc = TextEditingController();
    TextEditingController imgUrl = TextEditingController();

    var args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[300],
        title: Text(args == null ? 'Add Product' : 'Edit Product'),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.save))],
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
