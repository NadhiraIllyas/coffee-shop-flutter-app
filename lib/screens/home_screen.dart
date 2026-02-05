import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'cart_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // App Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Good Morning ☕",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Alex Johnson",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown[900],
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ProfileScreen()),
                      );
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.brown[800]!,
                            Colors.brown[600]!,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Main Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Search Bar
                    Container(
                      height: 56,
                      decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Colors.grey[200]!,
                          width: 1,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            Icon(
                              Icons.search,
                              color: Colors.grey[500],
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "Search coffee, beans, or blends...",
                                  hintStyle: TextStyle(
                                    color: Colors.grey[500],
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.brown[50],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Icon(
                                Icons.tune,
                                color: Colors.brown[700],
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 32),

                    // Categories Section
                    _buildCategoriesSection(),

                    const SizedBox(height: 32),

                    // Popular Items Section
                    _buildPopularItemsSection(),

                    const SizedBox(height: 32),

                    // Special Offer Banner
                    _buildSpecialOfferBanner(),

                    const SizedBox(height: 80),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildCategoriesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Categories",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.brown[900],
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "See All",
                style: TextStyle(
                  color: Colors.brown[700],
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 100,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildCategoryItem(
                icon: Icons.coffee,
                label: "Hot Coffee",
                isActive: true,
              ),
              const SizedBox(width: 16),
              _buildCategoryItem(
                icon: Icons.ac_unit,
                label: "Iced Coffee",
                isActive: false,
              ),
              const SizedBox(width: 16),
              _buildCategoryItem(
                icon: Icons.cake,
                label: "Pastries",
                isActive: false,
              ),
              const SizedBox(width: 16),
              _buildCategoryItem(
                icon: Icons.local_drink,
                label: "Tea",
                isActive: false,
              ),
              const SizedBox(width: 16),
              _buildCategoryItem(
                icon: Icons.local_drink,
                label: "Cakes",
                isActive: false,
              ),
              const SizedBox(width: 16),
              _buildCategoryItem(
                icon: Icons.local_drink,
                label: "Beverages",
                isActive: false,
              ),
              const SizedBox(width: 16),
              _buildCategoryItem(
                icon: Icons.local_drink,
                label: "Bun",
                isActive: false,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPopularItemsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Popular This Week",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.brown[900],
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "View All",
                style: TextStyle(
                  color: Colors.brown[700],
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 20,
          childAspectRatio: 0.75,
          children: [
            _buildCoffeeCard(
              name: "Caramel Macchiato",
              tagline: "Sweet caramel goodness",
              price: "\$4.99",
              rating: 4.8,
              imagePath: 'assets/images/coffee/caramel_macchiato.jpg',
            ),
            _buildCoffeeCard(
              name: "Cold Brew",
              tagline: "Smooth & refreshing",
              price: "\$3.99",
              rating: 4.6,
              imagePath: 'assets/images/coffee/cold_brew.jpg',
            ),
            _buildCoffeeCard(
              name: "Cappuccino",
              tagline: "Classic Italian",
              price: "\$4.49",
              rating: 4.7,
              imagePath: 'assets/images/coffee/cappuccino.jpg',
            ),
            _buildCoffeeCard(
              name: "Matcha Latte",
              tagline: "Green tea delight",
              price: "\$5.49",
              rating: 4.9,
              imagePath: 'assets/images/coffee/matcha_latte.jpg',
            ),
            _buildCoffeeCard(
              name: "Espresso",
              tagline: "Strong & bold",
              price: "\$2.99",
              rating: 4.5,
              imagePath: 'assets/images/coffee/espresso.jpg',
            ),
            _buildCoffeeCard(
              name: "Mocha",
              tagline: "Chocolate infused",
              price: "\$5.29",
              rating: 4.7,
              imagePath: 'assets/images/coffee/mocha.jpg',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSpecialOfferBanner() {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.brown[800]!,
            Colors.brown[600]!,
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.brown.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Special Offer",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Get 20% off on your first order!",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.local_offer,
                color: Colors.white,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }

// ... Keep all the helper methods (_buildCategoryItem, _buildCoffeeCard,
// _buildBottomNavigationBar, _buildNavItem) exactly the same as above
}