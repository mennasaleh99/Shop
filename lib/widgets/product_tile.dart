import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:shop/provider/product.dart';

class ProductTile extends StatefulWidget {
  final String imgUrl;
  final String title;
  final String id;

  const ProductTile({
    required this.imgUrl,
    required this.title,
    required this.id,
    Key? key,
  }) : super(key: key);

  @override
  State<ProductTile> createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: const SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: Container(
        color: Colors.white,
        child: ListTile(
          leading: CircleAvatar(
              child: FittedBox(
                child: Image.network(
                  widget.imgUrl,
                  fit: BoxFit.fill,
                ),
              ),
              radius: 20),
          title: Text(widget.title),
        ),
      ),
      secondaryActions: <Widget>[
        IconSlideAction(
            caption: 'Edit',
            color: Colors.black45,
            icon: Icons.edit_outlined,
            onTap: () {
              Navigator.pushNamed(context, '/AddEdit',
                  arguments: {'id': widget.id});
            }),
        IconSlideAction(
            caption: 'Delete',
            color: Colors.red,
            icon: Icons.delete,
            onTap: () {
              setState(() {
                Provider.of<Products>(context, listen: false)
                    .removeProduct(widget.id);
              });
            }),
      ],
    );
  }
}
