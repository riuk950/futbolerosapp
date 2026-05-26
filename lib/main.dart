import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'config/theme/app_theme.dart';
import 'config/routes/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Supabase with placeholders
  // In a real scenario, use --dart-define or a .env file
  await Supabase.initialize(
    url: 'https://placeholder.supabase.co',
    anonKey: 'placeholder_key',
  );

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Futboleros App',
      theme: AppTheme.lightTheme,
      routerConfig: appRouter,
    );
  }
}
