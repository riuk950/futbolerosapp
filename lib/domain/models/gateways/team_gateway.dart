import '../team.dart';

abstract class TeamGateway {
  Future<List<Team>> getAllTeams();
  Future<Team?> getTeamById(String id);
  Future<List<Team>> getFavoriteTeams(List<String> ids);
}
