import 'package:hive/hive.dart';
import '../../../domain/models/gateways/match_gateway.dart';
import '../../../domain/models/match.dart';

class HiveMatchAdapter implements MatchGateway {
  final Box<Map> _box;

  HiveMatchAdapter(this._box);

  @override
  Future<List<Match>> getMatchesByTournament(String tournamentId) async {
    // Basic local retrieval logic
    final matches = _box.values
        .where((m) => m['tournament_id'] == tournamentId)
        .map((m) => _fromMap(Map<String, dynamic>.from(m)))
        .toList();
    return matches;
  }

  @override
  Future<Match?> getMatchById(String id) async {
    final data = _box.get(id);
    if (data == null) return null;
    return _fromMap(Map<String, dynamic>.from(data));
  }

  @override
  Stream<List<Match>> watchLiveMatches() {
    // Hive box watch can be used for local real-time updates
    return _box.watch().map((_) => _box.values
        .where((m) => m['status'] == 'live')
        .map((m) => _fromMap(Map<String, dynamic>.from(m)))
        .toList());
  }

  Future<void> saveMatches(List<Match> matches) async {
    final data = {for (var m in matches) m.id: _toMap(m)};
    await _box.putAll(data);
  }

  Match _fromMap(Map<String, dynamic> map) {
    return Match(
      id: map['id'],
      tournamentId: map['tournament_id'],
      homeTeamId: map['home_team_id'],
      awayTeamId: map['away_team_id'],
      homeScore: map['home_score'],
      awayScore: map['away_score'],
      date: DateTime.parse(map['date']),
      status: MatchStatus.values.byName(map['status']),
    );
  }

  Map<String, dynamic> _toMap(Match match) {
    return {
      'id': match.id,
      'tournament_id': match.tournamentId,
      'home_team_id': match.homeTeamId,
      'away_team_id': match.awayTeamId,
      'home_score': match.homeScore,
      'away_score': match.awayScore,
      'date': match.date.toIso8601String(),
      'status': match.status.name,
    };
  }
}
