import 'package:dio/dio.dart' hide Headers;
import 'package:draft_flutter/data/fixtures_data.dart';
import 'package:draft_flutter/data/retrofit/apis.dart';
import 'package:draft_flutter/data/season_data.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://v3.football.api-sports.io")
abstract class ApiClient implements Apis {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET("/leagues")
  @Headers(<String, dynamic>{
    "x-rapidapi-key": "40220fc8e6a6886380a261bcaea348c8",
    "x-apisports-key": "40220fc8e6a6886380a261bcaea348c8",
    "x-rapidapi-host": "v3.football.api-sports.io"
  })
  Future<SeasonData> getCurrentSeason(
      {@Query("id") int leagueId = Apis.leagueId,
      @Query("current") bool isCurrent = true});

  @GET("/fixtures")
  @Headers(<String, dynamic>{
    "x-rapidapi-key": "40220fc8e6a6886380a261bcaea348c8",
    "x-apisports-key": "40220fc8e6a6886380a261bcaea348c8",
    "x-rapidapi-host": "v3.football.api-sports.io"
  })
  Future<FixturesData> getFixtures(@Query("season") int season, {@Query("league") int leagueId = Apis.leagueId});
}
