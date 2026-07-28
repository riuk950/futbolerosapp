import '../models/auth_session.dart';
import '../models/gateways/auth_gateway.dart';

class LoginUseCase {
  final AuthGateway _authGateway;

  LoginUseCase(this._authGateway);

  Future<AuthSession> execute(
      {required String email, required String password}) {
    return _authGateway.loginWithEmailPassword(
        email: email, password: password);
  }
}
