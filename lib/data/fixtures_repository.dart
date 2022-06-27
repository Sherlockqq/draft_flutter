import 'dart:developer';

import 'package:draft_flutter/data/retrofit/api_client.dart';
import 'package:draft_flutter/domain/fixtures.dart';

class FixturesRepository {
  final ApiClient _apiClient;

  FixturesRepository(this._apiClient);

  Future<int?> fetchCurrentSeason() async {
    try {
      final seasonData = await _apiClient.getCurrentSeason();
      return seasonData.getSeasonFromSeasonData();
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<Map<int, List<MatchFixtures>>?> fetchFixtures(int season) async {
    try {
      final fixturesData =
          await _apiClient.getFixtures(season);
      return fixturesData.getListMatchFixturesFromFixturesData();
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
