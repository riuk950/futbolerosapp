import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:futbolerosapp/app/app.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env.dev");

  final supabaseUrl = dotenv.env['SUPABASE_URL'] ??
      dotenv.env['API_BASE_URL'] ??
      'http://157.137.227.250:8000';
  final supabaseAnonKey =
      dotenv.env['SUPABASE_ANON_KEY'] ?? dotenv.env['AUTH_TOKEN_KEY'] ?? '';

  await Supabase.initialize(
    url: supabaseUrl,
    publishableKey: supabaseAnonKey,
  );

  runApp(const ProviderScope(child: FlavorApp()));
}
