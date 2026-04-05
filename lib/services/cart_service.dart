import 'package:supabase_flutter/supabase_flutter.dart';
import 'supabase_service.dart';
import 'auth_service.dart';

class CartService {
  final SupabaseClient _supabase = SupabaseService().client;
  final AuthService _authService = AuthService();

  Future<List<Map<String, dynamic>>> getCartItems() async {
    try {
      final user = _authService.currentUser;
      if (user == null) return [];
      
      final response = await _supabase
          .from('cart_items')
          .select('*, products(*)')
          .eq('user_id', user.id);
      
      return response;
    } catch (e) {
      print('Error fetching cart items: $e');
      return [];
    }
  }

  Future<void> addToCart({
    required String productId,
    required int quantity,
    required String size,
    required Map<String, dynamic> customization,
    required double price,
  }) async {
    try {
      final user = _authService.currentUser;
      if (user == null) throw Exception('User not logged in');
      
      await _supabase.from('cart_items').insert({
        'user_id': user.id,
        'product_id': productId,
        'quantity': quantity,
        'size': size,
        'customization': customization,
        'price': price,
      });
    } catch (e) {
      print('Error adding to cart: $e');
      rethrow;
    }
  }

  Future<void> updateCartItemQuantity(String cartItemId, int quantity) async {
    try {
      await _supabase
          .from('cart_items')
          .update({'quantity': quantity})
          .eq('id', cartItemId);
    } catch (e) {
      print('Error updating cart: $e');
      rethrow;
    }
  }

  Future<void> removeFromCart(String cartItemId) async {
    try {
      await _supabase
          .from('cart_items')
          .delete()
          .eq('id', cartItemId);
    } catch (e) {
      print('Error removing from cart: $e');
      rethrow;
    }
  }

  Future<void> clearCart() async {
    try {
      final user = _authService.currentUser;
      if (user == null) return;
      
      await _supabase
          .from('cart_items')
          .delete()
          .eq('user_id', user.id);
    } catch (e) {
      print('Error clearing cart: $e');
      rethrow;
    }
  }
}