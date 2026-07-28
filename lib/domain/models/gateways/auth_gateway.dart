import '../auth_session.dart';

abstract class AuthGateway {
  Future<AuthSession> loginWithEmailPassword({
    required String email,
    required String password,
  });
}
