import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:futbolerosapp/domain/models/gateways/match_gateway.dart';
import 'package:futbolerosapp/domain/models/match.dart';
import 'package:futbolerosapp/domain/usecase/get_matches_use_case.dart';

class MockMatchGateway extends Mock implements MatchGateway {}

void main() {
  late GetMatchesUseCase useCase;
  late MockMatchGateway mockGateway;

  setUp(() {
    mockGateway = MockMatchGateway();
    useCase = GetMatchesUseCase(mockGateway);
  });

  group('GetMatchesUseCase', () {
    final tMatches = [
      Match(
        id: '1',
        tournamentId: 't1',
        homeTeamId: 'h1',
        awayTeamId: 'a1',
        date: DateTime.now(),
        status: MatchStatus.scheduled,
      ),
    ];

    test('should get matches from the gateway', () async {
      // arrange
      when(() => mockGateway.getMatchesByTournament(any()))
          .thenAnswer((_) async => tMatches);

      // act
      final result = await useCase.execute('t1');

      // assert
      expect(result, tMatches);
      verify(() => mockGateway.getMatchesByTournament('t1')).called(1);
    });

    test('should watch live matches from the gateway', () {
      // arrange
      final stream = Stream.value(tMatches);
      when(() => mockGateway.watchLiveMatches()).thenAnswer((_) => stream);

      // act
      final result = useCase.watchLive();

      // assert
      expect(result, stream);
      verify(() => mockGateway.watchLiveMatches()).called(1);
    });
  });
}
