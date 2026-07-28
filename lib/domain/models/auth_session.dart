class AuthSession {
  final String accessToken;
  final String tokenType;
  final int expiresIn;
  final String? refreshToken;
  final String? userEmail;

  const AuthSession({
    required this.accessToken,
    required this.tokenType,
    required this.expiresIn,
    this.refreshToken,
    this.userEmail,
  });

  factory AuthSession.fromJson(Map<String, dynamic> json) {
    final user = json['user'];
    final String? email = user is Map<String, dynamic>
        ? user['email'] as String?
        : json['email'] as String?;

    return AuthSession(
      accessToken: json['access_token'] as String? ?? '',
      tokenType: json['token_type'] as String? ?? 'bearer',
      expiresIn: json['expires_in'] is int
          ? json['expires_in'] as int
          : int.tryParse('${json['expires_in']}') ?? 0,
      refreshToken: json['refresh_token'] as String?,
      userEmail: email,
    );
  }
}
