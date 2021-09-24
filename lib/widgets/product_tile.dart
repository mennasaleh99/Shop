import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ProductTile extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: const SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: Container(
        color: Colors.white,
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(imgUrl),
            radius: 20,
          ),
          title: Text(title),
        ),
      ),
      secondaryActions: <Widget>[
        IconSlideAction(
            caption: 'Edit',
            color: Colors.black45,
            icon: Icons.edit_outlined,
            onTap: () {
              Navigator.pushNamed(context, '/AddEdit', arguments: {'id': id});
            }),
        IconSlideAction(
            caption: 'Delete',
            color: Colors.red,
            icon: Icons.delete,
            onTap: () {}),
      ],
    );
  }
}
