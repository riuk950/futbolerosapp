import '../models/match.dart';
import '../models/gateways/match_gateway.dart';

class GetMatchesUseCase {
  final MatchGateway _matchGateway;

  GetMatchesUseCase(this._matchGateway);

  Future<List<Match>> execute(String tournamentId) {
    return _matchGateway.getMatchesByTournament(tournamentId);
  }

  Stream<List<Match>> watchLive() {
    return _matchGateway.watchLiveMatches();
  }
}
