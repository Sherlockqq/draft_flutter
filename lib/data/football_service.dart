import 'dart:convert';
import 'dart:developer';
import 'package:draft_flutter/data/fixtures_data.dart';
import 'package:draft_flutter/data/season_data.dart';
import 'package:draft_flutter/domain/fixtures.dart';
import 'package:http/http.dart' as http;

const URL = "v3.football.api-sports.io";
const KEY = "40220fc8e6a6886380a261bcaea348c8";
const LEAGUE_ID = 39;

class FootballService {
  Future<int?> getCurrentSeason() async {
    try {
      var url = Uri.parse("https://$URL/leagues?id=$LEAGUE_ID&current=true");
      final response = await http.get(url, headers: {
        'x-rapidapi-key': KEY,
        'x-apisports-key': KEY,
        'x-rapidapi-host': URL
      });
      if (response.statusCode == 200) {
        final parsed = jsonDecode(response.body);
        print('${parsed.runtimeType} : $parsed');
        SeasonData model = seasonDataFromJson(response.body);
        final result = model.getSeasonFromSeasonData();
        return result;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
///fixtures

  Future<Map<int,List<MatchFixtures>>?> getFixtures(int season) async {
    try {
      var url = Uri.parse("https://$URL/fixtures?league=$LEAGUE_ID&season=$season");
      final response = await http.get(url, headers: {
        'x-rapidapi-key': KEY,
        'x-apisports-key': KEY,
        'x-rapidapi-host': URL
      });

      if (response.statusCode == 200) {
        final parsed = jsonDecode(response.body);
        print('${parsed.runtimeType} : $parsed');

        FixturesData model = fixturesDataFromJson(response.body);
        final result = model.getListMatchFixturesFromFixturesData();
        return result;
      }

    } catch (e) {
        log(e.toString());
    }
    return null;
  }
}
