import 'package:flutter_test/flutter_test.dart';
import 'package:futbolerosapp/domain/models/auth_session.dart';
import 'package:futbolerosapp/domain/models/gateways/auth_gateway.dart';
import 'package:futbolerosapp/domain/usecase/login_use_case.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthGateway extends Mock implements AuthGateway {}

void main() {
  group('LoginUseCase', () {
    test('delegates the credentials to the auth gateway', () async {
      final gateway = MockAuthGateway();
      final session = AuthSession(
        accessToken: 'token',
        tokenType: 'bearer',
        expiresIn: 3600,
        refreshToken: 'refresh',
        userEmail: 'user@example.com',
      );

      when(
        () => gateway.loginWithEmailPassword(
          email: 'user@example.com',
          password: 'secret123',
        ),
      ).thenAnswer((_) async => session);

      final useCase = LoginUseCase(gateway);

      final result = await useCase.execute(
        email: 'user@example.com',
        password: 'secret123',
      );

      expect(result, session);
      verify(
        () => gateway.loginWithEmailPassword(
          email: 'user@example.com',
          password: 'secret123',
        ),
      ).called(1);
    });
  });
}
