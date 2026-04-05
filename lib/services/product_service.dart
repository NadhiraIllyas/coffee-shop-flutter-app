import 'package:supabase_flutter/supabase_flutter.dart';
import 'supabase_service.dart';

class ProductService {
  final SupabaseClient _supabase = SupabaseService().client;

  Future<List<Map<String, dynamic>>> getProducts({String? category}) async {
    try {
      var query = _supabase.from('products').select('*');
      
      if (category != null && category != 'All') {
        query = query.eq('category', category);
      }
      
      final response = await query;
      return response;
    } catch (e) {
      print('Error fetching products: $e');
      return [];
    }
  }

  Future<Map<String, dynamic>?> getProductById(String id) async {
    try {
      final response = await _supabase
          .from('products')
          .select('*')
          .eq('id', id)
          .single();
      return response;
    } catch (e) {
      print('Error fetching product: $e');
      return null;
    }
  }
}