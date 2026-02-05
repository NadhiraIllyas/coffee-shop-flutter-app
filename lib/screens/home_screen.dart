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

  // ========== HELPER METHODS ==========

  Widget _buildCategoryItem({
    required IconData icon,
    required String label,
    required bool isActive,
  }) {
    return Container(
      width: 100,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
        color: isActive ? Colors.brown[700] : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isActive ? Colors.brown[700]! : Colors.grey[200]!,
          width: 1,
        ),
        boxShadow: isActive
            ? [
                BoxShadow(
                  color: Colors.brown.withOpacity(0.2),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ]
            : [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.05),
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isActive ? Colors.white : Colors.brown[700],
            size: 24,
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: isActive ? Colors.white : Colors.brown[800],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCoffeeCard({
    required String name,
    required String tagline,
    required String price,
    required double rating,
    required String imagePath,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.grey[200]!,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Coffee Image
            Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.brown[50],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.brown[100],
                      child: Center(
                        child: Icon(
                          Icons.coffee,
                          size: 40,
                          color: Colors.brown[700],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 8),
            
            // Coffee Name
            Text(
              name,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.brown[900],
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            
            // Tag Line
            const SizedBox(height: 2),
            Text(
              tagline,
              style: TextStyle(
                fontSize: 11,
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            
            const SizedBox(height: 6),
            
            // Rating Row
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 14,
                ),
                const SizedBox(width: 2),
                Text(
                  rating.toString(),
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.brown[800],
                  ),
                ),
                const SizedBox(width: 2),
                Text(
                  "(120)",
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 8),
            
            // Price and Add Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  price,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown[700],
                  ),
                ),
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.brown[800]!,
                        Colors.brown[600]!,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Colors.grey[200]!,
            width: 1,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Home - Already on this screen
              _buildNavItem(
                icon: Icons.home,
                label: "Home",
                isActive: true,
                onTap: () {
                  // Already on home screen
                },
              ),
              
              // Order/Cart
              _buildNavItem(
                icon: Icons.shopping_bag,
                label: "Order",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CartScreen()),
                  );
                },
              ),
              
              // Favorite
              _buildNavItem(
                icon: Icons.favorite_border,
                label: "Favorite",
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Favorites feature coming soon!'),
                      backgroundColor: Colors.brown[700],
                    ),
                  );
                },
              ),
              
              // Profile
              _buildNavItem(
                icon: Icons.person_outline,
                label: "Profile",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ProfileScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    bool isActive = false,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isActive ? Colors.brown[700] : Colors.grey[600],
            size: 24,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: isActive ? Colors.brown[700] : Colors.grey[600],
              fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}