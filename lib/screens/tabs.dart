import 'package:flutter/material.dart';
import 'package:shop/provider/product.dart';
import 'package:shop/screens/allProducts.dart';
import 'package:shop/screens/favourite_screen.dart';
import 'package:shop/screens/product_screen.dart';

class Tabs extends StatefulWidget {
  const Tabs({Key? key}) : super(key: key);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  List<Product> products = [
    Product(
      id: '1',
      title: 'Product 1',
      price: 150,
      description: 'Any Description',
      imgUrl:
          'https://media.istockphoto.com/photos/running-shoes-picture-id1249496770?b=1&k=6&m=1249496770&s=170667a&w=0&h=9uttCAghGWpQC9aNxH7B50vsahNUHFL49IpI7J0Mxug=',
      isFav: false,
    ),
    Product(
      id: '2',
      title: 'Product 2',
      price: 100,
      description: 'Any Description',
      imgUrl:
          'https://media.istockphoto.com/photos/running-shoes-picture-id1249496770?b=1&k=6&m=1249496770&s=170667a&w=0&h=9uttCAghGWpQC9aNxH7B50vsahNUHFL49IpI7J0Mxug=',
      isFav: true,
    ),
    Product(
      id: '3',
      title: 'Product 3',
      price: 150,
      description: 'Any Description',
      imgUrl:
          'https://media.istockphoto.com/photos/running-shoes-picture-id1249496770?b=1&k=6&m=1249496770&s=170667a&w=0&h=9uttCAghGWpQC9aNxH7B50vsahNUHFL49IpI7J0Mxug=',
      isFav: false,
    ),
  ];
  int currentIndex = 0;
  late List<Map<String, dynamic>> pages;
  @override
  void initState() {
    pages = [
      {
        'title': Text("Product"),
        'body': ProductScreen(products),
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AllProducts(prods: products)));
            },
            icon: Icon(
              Icons.party_mode_rounded,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: pages[currentIndex]['body'],
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
