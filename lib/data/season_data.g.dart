// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'season_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeasonData _$SeasonDataFromJson(Map<String, dynamic> json) => SeasonData(
      seasonDataGet: json['get'] as String,
      parameters:
          Parameters.fromJson(json['parameters'] as Map<String, dynamic>),
      errors: json['errors'] as List<dynamic>,
      results: json['results'] as int,
      paging: Paging.fromJson(json['paging'] as Map<String, dynamic>),
      response: (json['response'] as List<dynamic>)
          .map((e) => Response.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SeasonDataToJson(SeasonData instance) =>
    <String, dynamic>{
      'get': instance.seasonDataGet,
      'parameters': instance.parameters.toJson(),
      'errors': instance.errors,
      'results': instance.results,
      'paging': instance.paging.toJson(),
      'response': instance.response.map((e) => e.toJson()).toList(),
    };

Paging _$PagingFromJson(Map<String, dynamic> json) => Paging(
      current: json['current'] as int,
      total: json['total'] as int,
    );

Map<String, dynamic> _$PagingToJson(Paging instance) => <String, dynamic>{
      'current': instance.current,
      'total': instance.total,
    };

Parameters _$ParametersFromJson(Map<String, dynamic> json) => Parameters(
      id: json['id'] as String,
      current: json['current'] as String,
    );

Map<String, dynamic> _$ParametersToJson(Parameters instance) =>
    <String, dynamic>{
      'id': instance.id,
      'current': instance.current,
    };

Response _$ResponseFromJson(Map<String, dynamic> json) => Response(
      league: League.fromJson(json['league'] as Map<String, dynamic>),
      country: Country.fromJson(json['country'] as Map<String, dynamic>),
      seasons: (json['seasons'] as List<dynamic>)
          .map((e) => Season.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResponseToJson(Response instance) => <String, dynamic>{
      'league': instance.league.toJson(),
      'country': instance.country.toJson(),
      'seasons': instance.seasons.map((e) => e.toJson()).toList(),
    };

Country _$CountryFromJson(Map<String, dynamic> json) => Country(
      name: json['name'] as String,
      code: json['code'] as String,
      flag: json['flag'] as String,
    );

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
      'flag': instance.flag,
    };

League _$LeagueFromJson(Map<String, dynamic> json) => League(
      id: json['id'] as int,
      name: json['name'] as String,
      type: json['type'] as String,
      logo: json['logo'] as String,
    );

Map<String, dynamic> _$LeagueToJson(League instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'logo': instance.logo,
    };

Season _$SeasonFromJson(Map<String, dynamic> json) => Season(
      year: json['year'] as int,
      start: DateTime.parse(json['start'] as String),
      end: DateTime.parse(json['end'] as String),
      current: json['current'] as bool,
      coverage: Coverage.fromJson(json['coverage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SeasonToJson(Season instance) => <String, dynamic>{
      'year': instance.year,
      'start': instance.start.toIso8601String(),
      'end': instance.end.toIso8601String(),
      'current': instance.current,
      'coverage': instance.coverage.toJson(),
    };

Coverage _$CoverageFromJson(Map<String, dynamic> json) => Coverage(
      fixtures: Fixtures.fromJson(json['fixtures'] as Map<String, dynamic>),
      standings: json['standings'] as bool,
      players: json['players'] as bool,
      topScorers: json['top_scorers'] as bool,
      topAssists: json['top_assists'] as bool,
      topCards: json['top_cards'] as bool,
      injuries: json['injuries'] as bool,
      predictions: json['predictions'] as bool,
      odds: json['odds'] as bool,
    );

Map<String, dynamic> _$CoverageToJson(Coverage instance) => <String, dynamic>{
      'fixtures': instance.fixtures.toJson(),
      'standings': instance.standings,
      'players': instance.players,
      'top_scorers': instance.topScorers,
      'top_assists': instance.topAssists,
      'top_cards': instance.topCards,
      'injuries': instance.injuries,
      'predictions': instance.predictions,
      'odds': instance.odds,
    };

Fixtures _$FixturesFromJson(Map<String, dynamic> json) => Fixtures(
      events: json['events'] as bool,
      lineups: json['lineups'] as bool,
      statisticsFixtures: json['statistics_fixtures'] as bool,
      statisticsPlayers: json['statistics_players'] as bool,
    );

Map<String, dynamic> _$FixturesToJson(Fixtures instance) => <String, dynamic>{
      'events': instance.events,
      'lineups': instance.lineups,
      'statistics_fixtures': instance.statisticsFixtures,
      'statistics_players': instance.statisticsPlayers,
    };
