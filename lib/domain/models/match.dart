import 'team.dart';

enum MatchStatus { scheduled, live, finished, postponed }

class Match {
  final String id;
  final String tournamentId;
  final String homeTeamId;
  final String awayTeamId;
  final Team? homeTeam;
  final Team? awayTeam;
  final int homeScore;
  final int awayScore;
  final DateTime date;
  final String? venue;
  final MatchStatus status;

  Match({
    required this.id,
    required this.tournamentId,
    required this.homeTeamId,
    required this.awayTeamId,
    this.homeTeam,
    this.awayTeam,
    this.homeScore = 0,
    this.awayScore = 0,
    required this.date,
    this.venue,
    required this.status,
  });
}
