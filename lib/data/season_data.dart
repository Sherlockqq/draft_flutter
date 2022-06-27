// To parse this JSON data, do
//
//     final seasonData = seasonDataFromJson(jsonString);

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'season_data.g.dart';

SeasonData seasonDataFromJson(String str) =>
    SeasonData.fromJson(json.decode(str));

String seasonDataToJson(SeasonData data) => json.encode(data.toJson());

@JsonSerializable(explicitToJson: true)
class SeasonData {
  SeasonData({
    required this.seasonDataGet,
    required this.parameters,
    required this.errors,
    required this.results,
    required this.paging,
    required this.response,
  });

  @JsonKey(name: 'get')
  String seasonDataGet;
  @JsonKey(name: 'parameters')
  Parameters parameters;
  @JsonKey(name: 'errors')
  List<dynamic> errors;
  @JsonKey(name: 'results')
  int results;
  @JsonKey(name: 'paging')
  Paging paging;
  @JsonKey(name: 'response')
  List<Response> response;

  factory SeasonData.fromJson(Map<String, dynamic> json) =>
      _$SeasonDataFromJson(json);

  Map<String, dynamic> toJson() => _$SeasonDataToJson(this);

  int getSeasonFromSeasonData() {
    return response[0].seasons[0].year;
  }
}

@JsonSerializable()
class Paging {
  Paging({
    required this.current,
    required this.total,
  });

  @JsonKey(name: 'current')
  int current;
  @JsonKey(name: 'total')
  int total;

  factory Paging.fromJson(Map<String, dynamic> json) => _$PagingFromJson(json);

  Map<String, dynamic> toJson() => _$PagingToJson(this);
}

@JsonSerializable()
class Parameters {
  Parameters({
    required this.id,
    required this.current,
  });

  @JsonKey(name: 'id')
  String id;
  @JsonKey(name: 'current')
  String current;

  factory Parameters.fromJson(Map<String, dynamic> json) =>
      _$ParametersFromJson(json);

  Map<String, dynamic> toJson() => _$ParametersToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Response {
  Response({
    required this.league,
    required this.country,
    required this.seasons,
  });

  @JsonKey(name: 'league')
  League league;
  @JsonKey(name: 'country')
  Country country;
  @JsonKey(name: 'seasons')
  List<Season> seasons;

  factory Response.fromJson(Map<String, dynamic> json) =>
      _$ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseToJson(this);
}

@JsonSerializable()
class Country {
  Country({
    required this.name,
    required this.code,
    required this.flag,
  });

  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'code')
  String code;
  @JsonKey(name: 'flag')
  String flag;

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);

  Map<String, dynamic> toJson() => _$CountryToJson(this);
}

@JsonSerializable()
class League {
  League({
    required this.id,
    required this.name,
    required this.type,
    required this.logo,
  });

  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'type')
  String type;
  @JsonKey(name: 'logo')
  String logo;

  factory League.fromJson(Map<String, dynamic> json) => _$LeagueFromJson(json);

  Map<String, dynamic> toJson() => _$LeagueToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Season {
  Season({
    required this.year,
    required this.start,
    required this.end,
    required this.current,
    required this.coverage,
  });

  @JsonKey(name: 'year')
  int year;
  @JsonKey(name: 'start')
  DateTime start;
  @JsonKey(name: 'end')
  DateTime end;
  @JsonKey(name: 'current')
  bool current;
  @JsonKey(name: 'coverage')
  Coverage coverage;

  factory Season.fromJson(Map<String, dynamic> json) => _$SeasonFromJson(json);

  Map<String, dynamic> toJson() => _$SeasonToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Coverage {
  Coverage({
    required this.fixtures,
    required this.standings,
    required this.players,
    required this.topScorers,
    required this.topAssists,
    required this.topCards,
    required this.injuries,
    required this.predictions,
    required this.odds,
  });
  @JsonKey(name: 'fixtures')
  Fixtures fixtures;
  @JsonKey(name: 'standings')
  bool standings;
  @JsonKey(name: 'players')
  bool players;
  @JsonKey(name: 'top_scorers')
  bool topScorers;
  @JsonKey(name: 'top_assists')
  bool topAssists;
  @JsonKey(name: 'top_cards')
  bool topCards;
  @JsonKey(name: 'injuries')
  bool injuries;
  @JsonKey(name: 'predictions')
  bool predictions;
  @JsonKey(name: 'odds')
  bool odds;

  factory Coverage.fromJson(Map<String, dynamic> json) =>
      _$CoverageFromJson(json);

  Map<String, dynamic> toJson() => _$CoverageToJson(this);
}

@JsonSerializable()
class Fixtures {
  Fixtures({
    required this.events,
    required this.lineups,
    required this.statisticsFixtures,
    required this.statisticsPlayers,
  });

  @JsonKey(name: 'events')
  bool events;
  @JsonKey(name: 'lineups')
  bool lineups;
  @JsonKey(name: 'statistics_fixtures')
  bool statisticsFixtures;
  @JsonKey(name: 'statistics_players')
  bool statisticsPlayers;

  factory Fixtures.fromJson(Map<String, dynamic> json) =>
      _$FixturesFromJson(json);

  Map<String, dynamic> toJson() => _$FixturesToJson(this);
}
