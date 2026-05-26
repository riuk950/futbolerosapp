import '../news.dart';

abstract class NewsGateway {
  Future<List<News>> getLatestNews({int limit = 10});
  Future<List<News>> getNewsByTournament(String tournamentId);
}
