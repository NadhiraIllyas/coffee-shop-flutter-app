import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee Shop',
      theme: ThemeData(primarySwatch: Colors.brown),
      home: const AddToCartPage(),
    );
  }
}

class AddToCartPage extends StatefulWidget {
  const AddToCartPage({super.key});

  @override
  State<AddToCartPage> createState() => _AddToCartPageState();
}

class _AddToCartPageState extends State<AddToCartPage> {
  int quantity = 1;
  double sugarLevel = 50.0;
  bool extraShot = false;
  bool whippedCream = false;
  String selectedSize = 'Medium';
  List<String> sizes = ['Small', 'Medium', 'Large'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add to Cart',
           style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
        ),
        backgroundColor: const Color.fromARGB(255, 71, 24, 9),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Info with Image
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.brown[50],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  // Using actual image asset
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        // Network image - will work immediately
                        image: NetworkImage(
                          'https://images.unsplash.com/photo-1498804103079-a6351b050096?w=400',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Classic Cappuccino',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.brown[900],
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Rich espresso with steamed milk',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.brown[700],
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.amber[700],
                              size: 18,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '4.8 (240)',
                              style: TextStyle(color: Colors.brown[700]),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '\$4.50',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.brown[800],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Rest of your code remains the same...
            const SizedBox(height: 30),
            Text(
              'Select Size:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.brown[900],
              ),
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: sizes.map((size) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: ChoiceChip(
                      label: Text(size),
                      selected: selectedSize == size,
                      selectedColor: const Color.fromARGB(255, 243, 205, 192),
                      onSelected: (selected) {
                        setState(() {
                          selectedSize = size;
                        });
                      },
                    ),
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 30),
            Text(
              'Sugar Level:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.brown[900],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.brown[200]!),
              ),
              child: Column(
                children: [
                  Slider(
                    value: sugarLevel,
                    min: 0,
                    max: 100,
                    divisions: 4,
                    label: getSugarLabel(sugarLevel),
                    activeColor: Colors.brown,
                    inactiveColor: Colors.brown[200],
                    onChanged: (value) {
                      setState(() {
                        sugarLevel = value;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'No Sugar',
                        style: TextStyle(color: Colors.brown[700]),
                      ),
                      Text(
                        getSugarLabel(sugarLevel),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.brown[800],
                        ),
                      ),
                      Text(
                        'Very Sweet',
                        style: TextStyle(color: Colors.brown[700]),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
            Text(
              'Add-ons:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.brown[900],
              ),
            ),
            const SizedBox(height: 10),

            Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.brown[200]!),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Extra Espresso Shot',
                    style: TextStyle(fontSize: 16, color: Colors.brown[800]),
                  ),
                  Switch(
                    value: extraShot,
                    activeThumbColor: Colors.brown,
                    onChanged: (value) {
                      setState(() {
                        extraShot = value;
                      });
                    },
                  ),
                ],
              ),
            ),

            Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.brown[200]!),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Whipped Cream',
                    style: TextStyle(fontSize: 16, color: Colors.brown[800]),
                  ),
                  Switch(
                    value: whippedCream,
                    activeThumbColor: Colors.brown,
                    onChanged: (value) {
                      setState(() {
                        whippedCream = value;
                      });
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
            Text(
              'Quantity:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.brown[900],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.brown[200]!),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      if (quantity > 1) {
                        setState(() {
                          quantity--;
                        });
                      }
                    },
                    icon: Icon(Icons.remove, color: Colors.brown),
                  ),
                  Text(
                    '$quantity',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown[900],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        quantity++;
                      });
                    },
                    icon: Icon(Icons.add, color: Colors.brown),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.brown[50],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total:',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown[900],
                    ),
                  ),
                  Text(
                    '\$${calculateTotal().toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown[800],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),

      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: SizedBox(
          height: 56,
          child: ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Added to Cart!'),
                  content: Text(
                    'Added $quantity $selectedSize Cappuccino to cart.',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.brown,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.shopping_cart, color: Colors.white),
                SizedBox(width: 10),
                Text(
                  'Add to Cart',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImageFallback() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.brown[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Center(
        child: Icon(Icons.coffee, size: 40, color: Colors.white),
      ),
    );
  }

  String getSugarLabel(double value) {
    if (value <= 25) return 'No Sugar';
    if (value <= 50) return 'Light';
    if (value <= 75) return 'Medium';
    return 'Sweet';
  }

  double calculateTotal() {
    double basePrice = 4.50;

    if (selectedSize == 'Large') basePrice += 1.00;

    if (extraShot) basePrice += 0.75;
    if (whippedCream) basePrice += 0.50;

    return basePrice * quantity;
  }
}
