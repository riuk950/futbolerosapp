import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../domain/models/auth_session.dart';
import '../../../domain/models/gateways/auth_gateway.dart';
import '../../../env/env_def.dart';

class SupabaseAuthAdapter implements AuthGateway {
  const SupabaseAuthAdapter();

  @override
  Future<AuthSession> loginWithEmailPassword({
    required String email,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse(EnvDef.authTokenUrl),
      headers: {
        'apikey': EnvDef.supabaseAuthApiKey,
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode >= 400) {
      throw Exception('Error al iniciar sesión: ${response.body}');
    }

    final decoded = jsonDecode(response.body) as Map<String, dynamic>;
    return AuthSession.fromJson(decoded);
  }
}
