import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final List<Map<String, dynamic>> _selectedProducts = [
    {'id': 1, 'name': 'Product 1', 'price': 10.0, 'quantity': 2},
    {'id': 2, 'name': 'Product 2', 'price': 20.0, 'quantity': 1},
    {'id': 3, 'name': 'Product 3', 'price': 15.0, 'quantity': 3},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: _selectedProducts.isEmpty
          ? Center(
              child: Text('No products added to cart'),
            )
          : ListView.builder(
              itemCount: _selectedProducts.length,
              itemBuilder: (BuildContext context, int index) {
                final selectedProduct = _selectedProducts[index];
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(selectedProduct['name'][0]),
                  ),
                  title: Text(selectedProduct['name']),
                  subtitle: Text('Price: \$${selectedProduct['price']}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          setState(() {
                            if (selectedProduct['quantity'] > 1) {
                              selectedProduct['quantity']--;
                            } else {
                              _selectedProducts.removeAt(index);
                            }
                          });
                        },
                      ),
                      Text('${selectedProduct['quantity']}'),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            selectedProduct['quantity']++;
                          });
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
