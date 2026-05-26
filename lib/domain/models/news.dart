class News {
  final String id;
  final String title;
  final String content;
  final String? imageUrl;
  final DateTime publishedAt;
  final String? author;
  final String? tournamentId;

  News({
    required this.id,
    required this.title,
    required this.content,
    this.imageUrl,
    required this.publishedAt,
    this.author,
    this.tournamentId,
  });
}
