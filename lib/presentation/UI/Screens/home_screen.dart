import 'package:flutter/material.dart';

void main() {
  runApp(GroceryShopApp());
}

class GroceryShopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grocery Shop',
      theme: ThemeData(
        primaryColor: Colors.green,
        hintColor: Colors.greenAccent,
      ),
      home: GroceryShopHome(),
    );
  }
}

class GroceryShopHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grocery Shop'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Add functionality to navigate to the shopping cart screen
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Categories',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CategoryCard('Fruits', 'assets/fruits.jpg'),
                CategoryCard('Vegetables', 'assets/vegetables.jpg'),
                CategoryCard('Dairy', 'assets/dairy.jpg'),
                // Add more category cards here
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Featured Products',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          // Add featured product cards here
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String categoryName;
  final String imagePath;

  CategoryCard(this.categoryName, this.imagePath);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          // Add functionality to navigate to the category's product list
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 8.0),
            Text(categoryName),
          ],
        ),
      ),
    );
  }
}
