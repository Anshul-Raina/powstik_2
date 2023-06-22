import 'package:flutter/material.dart';

import 'billing_details.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final TextEditingController coupon_controller = TextEditingController();
  List<CartItem> _cartItems = [
    CartItem(name: 'Item 1', price: 10.0, quantity: 1),
    CartItem(name: 'Item 2', price: 20.0, quantity: 2),
    CartItem(name: 'Item 3', price: 30.0, quantity: 3),
  ];

  double _totalPrice = 0.0;

  @override
  void initState() {
    super.initState();
    _calculateTotalPrice();
  }

  void _calculateTotalPrice() {
    double totalPrice = 0.0;
    for (var item in _cartItems) {
      totalPrice += item.price * item.quantity;
    }
    setState(() {
      _totalPrice = totalPrice;
    });
  }

  void _incrementQuantity(CartItem item) {
    setState(() {
      item.quantity++;
      _calculateTotalPrice();
    });
  }

  void _decrementQuantity(CartItem item) {
    if (item.quantity > 1) {
      setState(() {
        item.quantity--;
        _calculateTotalPrice();
      });
    }
  }

  void _removeItem(CartItem item) {
    setState(() {
      _cartItems.remove(item);
      _calculateTotalPrice();
    });
  }

  void _applyCoupon(String couponCode) {
    // Check if the coupon code is valid
    if (couponCode == 'DISCOUNT20') {
      // Apply the 20% discount
      setState(() {
        _totalPrice *= 0.8;
      });
      // Show a snackbar to confirm the discount was applied
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Coupon code applied!')),
      );
    } else {
      // Show an error message if the coupon code is invalid
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid coupon code')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        backgroundColor: Color.fromARGB(255, 38, 185, 43),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _cartItems.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: IconButton(
                    icon: Icon(Icons.remove_circle),
                    onPressed: () => _removeItem(_cartItems[index]),
                  ),
                  title: Text(_cartItems[index].name),
                  subtitle: Text('\₹${_cartItems[index].price}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () => _decrementQuantity(_cartItems[index]),
                      ),
                      Text('${_cartItems[index].quantity}'),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () => _incrementQuantity(_cartItems[index]),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: TextFormField(
                    controller: coupon_controller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Apply Coupon-"DISCOUNT20"',
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                  ),
                  onPressed: () {
                    _applyCoupon(coupon_controller.text);
                  },
                  child: Text('Apply coupon'),
                ),
              ),
            ],
          ),
          Divider(thickness: 1),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Price:',
                  style: TextStyle(fontSize: 20.0),
                ),
                Text(
                  '\₹$_totalPrice',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            width: 370,
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BillingDetailsPage()),
                );
              },
              child: Text(
                'PROCEED TO CHECKOUT',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CartItem {
  final String name;
  final double price;
  int quantity;

  CartItem({required this.name, required this.price, required this.quantity});
}
