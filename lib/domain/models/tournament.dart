class Tournament {
  final String id;
  final String name;
  final String? description;
  final DateTime startDate;
  final DateTime? endDate;
  final String? status; // active, completed, upcoming

  Tournament({
    required this.id,
    required this.name,
    this.description,
    required this.startDate,
    this.endDate,
    this.status,
  });
}
