import '../../../domain/models/match.dart';
import '../../../domain/models/team.dart';

class MatchMapper {
  static Match fromSupabase(Map<String, dynamic> json) {
    return Match(
      id: json['id'],
      tournamentId: json['tournament_id'],
      homeTeamId: json['home_team_id'],
      awayTeamId: json['away_team_id'],
      homeScore: json['home_score'] ?? 0,
      awayScore: json['away_score'] ?? 0,
      date: DateTime.parse(json['date']),
      venue: json['venue'],
      status: _parseStatus(json['status']),
      homeTeam: json['home_team'] != null ? TeamMapper.fromSupabase(json['home_team']) : null,
      awayTeam: json['away_team'] != null ? TeamMapper.fromSupabase(json['away_team']) : null,
    );
  }

  static MatchStatus _parseStatus(String status) {
    switch (status) {
      case 'live':
        return MatchStatus.live;
      case 'finished':
        return MatchStatus.finished;
      case 'postponed':
        return MatchStatus.postponed;
      default:
        return MatchStatus.scheduled;
    }
  }
}

class TeamMapper {
  static Team fromSupabase(Map<String, dynamic> json) {
    return Team(
      id: json['id'],
      name: json['name'],
      logoUrl: json['logo_url'],
      city: json['city'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}
