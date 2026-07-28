import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvDef {
  static bool get isProduction => dotenv.env['DEBUG_MODE'] != 'true';
  static bool get isDevelopment => !isProduction;
  static String get flavor => isProduction ? 'prod' : 'dev';

  static String get supabaseUrl =>
      dotenv.env['SUPABASE_URL'] ?? dotenv.env['API_BASE_URL'] ?? '';

  static String get supabaseAuthApiKey =>
      dotenv.env['SUPABASE_ANON_KEY'] ?? dotenv.env['AUTH_TOKEN_KEY'] ?? '';

  static String get authTokenUrl =>
      '$supabaseUrl/auth/v1/token?grant_type=password';
}
