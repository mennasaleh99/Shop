import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop/screens/addEdit.dart';
import 'package:shop/screens/description_screen.dart';

class ProductWidget extends StatefulWidget {
  final String imgUrl;
  final String name;
  final bool isFav;

  const ProductWidget(
      {required this.name, required this.imgUrl, required this.isFav, Key? key})
      : super(key: key);

  @override
  _ProductWidgetState createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DescriptionScreen(
                        title: widget.name,
                        imgUrl: widget.imgUrl,
                        price: "price",
                        desc: "desc",
                      )));
        },
        child: GridTile(
          child: Image.network(
            widget.imgUrl,
          ),
          header: ListTile(
            trailing: IconButton(
                onPressed: () {},
                icon: Icon(
                  widget.isFav ? Icons.favorite : Icons.favorite_border,
                  color: Colors.green[300],
                )),
          ),
          footer: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  widget.name,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 15),
                ),
              ),
            ),
            color: Colors.black.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}
