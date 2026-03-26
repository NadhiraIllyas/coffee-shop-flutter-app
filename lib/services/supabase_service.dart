import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  static final SupabaseService _instance = SupabaseService._internal();
  factory SupabaseService() => _instance;
  SupabaseService._internal();

  static Future<void> initialize() async {
    await Supabase.initialize(
      url: 'https://wshqjqzitrtxvavlcmer.supabase.co', // Replace with your Supabase URL
      anonKey: 'sb_publishable_DV1jmT7Oo0mHMJVBpwRz9w_BytBtSGp', // Replace with your anon key
    );
  }

  SupabaseClient get client => Supabase.instance.client;
  
  // Helper methods
  SupabaseClient get supabase => client;
}