import 'package:draft_flutter/data/fixtures_data.dart';
import 'package:draft_flutter/data/season_data.dart';
import 'package:draft_flutter/data/football_service.dart';
import 'package:draft_flutter/domain/fixtures.dart';



class FixturesRepository {
  final _service = FootballService();

  Future<int?> fetchCurrentSeason() {
    return _service.getCurrentSeason();
  }

  Future<Map<int,List<MatchFixtures>>?> fetchFixtures(int season) {
    return _service.getFixtures(season);
  }
}