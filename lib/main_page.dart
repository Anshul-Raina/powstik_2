import 'package:flutter/material.dart';

import 'add_to_cart.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {'name': 'Pizza', 'price': 12.99},
    {'name': 'Burger', 'price': 7.99},
    {'name': 'Salad', 'price': 6.99},
    {'name': 'Pasta', 'price': 9.99},
    {'name': 'Tacos', 'price': 10.99},
    {'name': 'Sushi', 'price': 15.99},
    {'name': 'Steak', 'price': 19.99},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 38, 185, 43),
        title: Text(
          'powstik',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Navigate to search screen
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Navigate to shopping cart screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(),
                ),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            SizedBox(
              height: 65,
            ),
            ListTile(
              title: Text(
                'Healthy Snacks',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                // Navigate to home screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
                ;
              },
            ),
            ListTile(
              title: Text(
                'Millets',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                // Navigate to products screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            ListTile(
              title: Text(
                'Super Foods',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                // Navigate to categories screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            ListTile(
              title: Text(
                'Plant Proteins',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                // Navigate to orders screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            ListTile(
              title: Text(
                'Beverages',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                // Navigate to orders screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            ListTile(
              title: Text(
                'Medical Nutrition -> Diabetes',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                // Navigate to orders screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            ListTile(
              title: Text(
                'Organic Staples',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                // Navigate to orders screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            ListTile(
              title: Text(
                'Services',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                // Navigate to orders screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            ListTile(
              title: Text(
                'All',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                // Navigate to orders screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
          ],
        ),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(8),
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.60,
        ),
        itemBuilder: (BuildContext context, int index) {
          final product = products[index];
          return Container(
            height: double.infinity,
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 1,
                    child: Image.network(
                      'https://via.placeholder.com/300x300',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          product['name'],
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '\₹${product['price']}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            color: Colors.deepOrange,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add_circle,
                                  size: 20,
                                  color: Colors.white,
                                ),
                                TextButton(
                                  child: Text(
                                    'ADD TO CART',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                  onPressed: () {
                                    // Add product to cart
                                    // Product(
                                    //     name: product['name'],
                                    //     price: product['price'],
                                    //     quantity: 1);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
