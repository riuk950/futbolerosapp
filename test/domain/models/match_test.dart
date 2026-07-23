import 'package:flutter_test/flutter_test.dart';
import 'package:futbolerosapp/domain/models/match.dart';

void main() {
  group('Match Model Tests', () {
    test('should create a Match instance with default scores', () {
      final match = Match(
        id: '1',
        tournamentId: 't1',
        homeTeamId: 'ht1',
        awayTeamId: 'at1',
        date: DateTime(2026, 5, 26),
        status: MatchStatus.scheduled,
      );

      expect(match.homeScore, 0);
      expect(match.awayScore, 0);
      expect(match.status, MatchStatus.scheduled);
    });

    test('MatchStatus enum should have expected values', () {
      expect(MatchStatus.values.length, 4);
      expect(MatchStatus.live.name, 'live');
    });
  });
}
