import '../match.dart';

abstract class MatchGateway {
  Future<List<Match>> getMatchesByTournament(String tournamentId);
  Future<Match?> getMatchById(String id);
  Stream<List<Match>> watchLiveMatches();
}
