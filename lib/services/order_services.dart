import 'package:supabase_flutter/supabase_flutter.dart';
import 'supabase_service.dart';
import 'auth_service.dart';

class OrderService {
  final SupabaseClient _supabase = SupabaseService().client;
  final AuthService _authService = AuthService();

  Future<Map<String, dynamic>> createOrder({
    required double totalAmount,
    required String deliveryAddress,
    required String paymentMethod,
    required List<Map<String, dynamic>> items,
  }) async {
    try {
      final user = _authService.currentUser;
      if (user == null) throw Exception('User not logged in');
      
      // Generate order number
      final orderNumber = 'ORD-${DateTime.now().millisecondsSinceEpoch}';
      
      // Create order
      final orderResponse = await _supabase.from('orders').insert({
        'user_id': user.id,
        'order_number': orderNumber,
        'total_amount': totalAmount,
        'delivery_address': deliveryAddress,
        'payment_method': paymentMethod,
        'status': 'pending',
      }).select().single();
      
      // Create order items
      for (var item in items) {
        await _supabase.from('order_items').insert({
          'order_id': orderResponse['id'],
          'product_id': item['product_id'],
          'product_name': item['product_name'],
          'quantity': item['quantity'],
          'size': item['size'],
          'customization': item['customization'],
          'price': item['price'],
        });
      }
      
      // Clear cart
      await _supabase
          .from('cart_items')
          .delete()
          .eq('user_id', user.id);
      
      return orderResponse;
    } catch (e) {
      print('Error creating order: $e');
      rethrow;
    }
  }

  Future<List<Map<String, dynamic>>> getOrders() async {
    try {
      final user = _authService.currentUser;
      if (user == null) return [];
      
      final response = await _supabase
          .from('orders')
          .select('*, order_items(*)')
          .eq('user_id', user.id)
          .order('created_at', ascending: false);
      
      return response;
    } catch (e) {
      print('Error fetching orders: $e');
      return [];
    }
  }
}