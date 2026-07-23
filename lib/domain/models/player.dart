class Player {
  final String id;
  final String teamId;
  final String firstName;
  final String lastName;
  final int? jerseyNumber;
  final String? position;
  final String? photoUrl;

  Player({
    required this.id,
    required this.teamId,
    required this.firstName,
    required this.lastName,
    this.jerseyNumber,
    this.position,
    this.photoUrl,
  });

  String get fullName => '$firstName $lastName';
}
