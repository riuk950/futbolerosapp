import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvDef {
  static bool get isProduction => dotenv.env['DEBUG_MODE'] != 'true';
  static bool get isDevelopment => !isProduction;
  static String get flavor => isProduction ? 'prod' : 'dev';
}
