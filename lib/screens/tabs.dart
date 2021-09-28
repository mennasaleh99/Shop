import 'package:flutter/material.dart';
import 'package:shop/provider/product.dart';

import 'package:shop/screens/allProducts.dart';
import 'package:shop/screens/favourite_screen.dart';
import 'package:shop/screens/product_screen.dart';
import 'package:provider/provider.dart';

class Tabs extends StatefulWidget {
  const Tabs({Key? key}) : super(key: key);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int currentIndex = 0;
  late List<Map<String, dynamic>> pages;

  @override
  void initState() {
    pages = [
      {
        'title': Text("Product"),
        'body': ProductScreen(),
      },
      {
        'title': Text("Favourite"),
        'body': FavouriteScreen(),
      },
    ];
    super.initState();
  }

  void changeIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: pages[currentIndex]['title'],
        backgroundColor: Colors.green[300],
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AllProducts()));
            },
            icon: Icon(
              Icons.party_mode_rounded,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<Products>(context).getData(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return pages[currentIndex]['body'];
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green[300],
        unselectedItemColor: Colors.grey[500],
        selectedItemColor: Colors.white,
        currentIndex: currentIndex,
        onTap: changeIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category_sharp),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favourite',
          ),
        ],
      ),
    );
  }
}
