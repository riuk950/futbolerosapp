import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../domain/models/gateways/match_gateway.dart';
import '../../../domain/models/match.dart';
import '../../helpers/mappers/match_mapper.dart';

class SupabaseMatchAdapter implements MatchGateway {
  final SupabaseClient _client;

  SupabaseMatchAdapter(this._client);

  @override
  Future<List<Match>> getMatchesByTournament(String tournamentId) async {
    final response = await _client
        .from('matches')
        .select('*, home_team:home_team_id(*), away_team:away_team_id(*)')
        .eq('tournament_id', tournamentId)
        .order('date');

    return (response as List).map((json) => MatchMapper.fromSupabase(json)).toList();
  }

  @override
  Future<Match?> getMatchById(String id) async {
    final response = await _client
        .from('matches')
        .select('*, home_team:home_team_id(*), away_team:away_team_id(*)')
        .eq('id', id)
        .single();

    return MatchMapper.fromSupabase(response);
  }

  @override
  Stream<List<Match>> watchLiveMatches() {
    return _client
        .from('matches')
        .stream(primaryKey: ['id'])
        .eq('status', 'live')
        .map((response) => response.map((json) => MatchMapper.fromSupabase(json)).toList());
  }
}
