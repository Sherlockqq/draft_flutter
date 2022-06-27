// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fixtures_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FixturesData _$FixturesDataFromJson(Map<String, dynamic> json) => FixturesData(
      get: json['get'] as String,
      parameters:
          Parameters.fromJson(json['parameters'] as Map<String, dynamic>),
      errors: json['errors'] as List<dynamic>,
      results: json['results'] as int,
      paging: Paging.fromJson(json['paging'] as Map<String, dynamic>),
      response: (json['response'] as List<dynamic>)
          .map((e) => Response.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FixturesDataToJson(FixturesData instance) =>
    <String, dynamic>{
      'get': instance.get,
      'parameters': instance.parameters.toJson(),
      'errors': instance.errors,
      'results': instance.results,
      'paging': instance.paging.toJson(),
      'response': instance.response.map((e) => e.toJson()).toList(),
    };

Parameters _$ParametersFromJson(Map<String, dynamic> json) => Parameters(
      league: json['league'] as String,
      season: json['season'] as String,
    );

Map<String, dynamic> _$ParametersToJson(Parameters instance) =>
    <String, dynamic>{
      'league': instance.league,
      'season': instance.season,
    };

Paging _$PagingFromJson(Map<String, dynamic> json) => Paging(
      current: json['current'] as int,
      total: json['total'] as int,
    );

Map<String, dynamic> _$PagingToJson(Paging instance) => <String, dynamic>{
      'current': instance.current,
      'total': instance.total,
    };

Response _$ResponseFromJson(Map<String, dynamic> json) => Response(
      fixture: Fixture.fromJson(json['fixture'] as Map<String, dynamic>),
      league: League.fromJson(json['league'] as Map<String, dynamic>),
      teams: Teams.fromJson(json['teams'] as Map<String, dynamic>),
      goals: Goals.fromJson(json['goals'] as Map<String, dynamic>),
      score: Score.fromJson(json['score'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResponseToJson(Response instance) => <String, dynamic>{
      'fixture': instance.fixture.toJson(),
      'league': instance.league.toJson(),
      'teams': instance.teams.toJson(),
      'goals': instance.goals.toJson(),
      'score': instance.score.toJson(),
    };

Fixture _$FixtureFromJson(Map<String, dynamic> json) => Fixture(
      id: json['id'] as int,
      referee: json['referee'] as String?,
      timezone: json['timezone'] as String,
      date: json['date'] as String,
      timestamp: json['timestamp'] as int,
      periods: Periods.fromJson(json['periods'] as Map<String, dynamic>),
      venue: Venue.fromJson(json['venue'] as Map<String, dynamic>),
      status: Status.fromJson(json['status'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FixtureToJson(Fixture instance) => <String, dynamic>{
      'id': instance.id,
      'referee': instance.referee,
      'timezone': instance.timezone,
      'date': instance.date,
      'timestamp': instance.timestamp,
      'periods': instance.periods.toJson(),
      'venue': instance.venue.toJson(),
      'status': instance.status.toJson(),
    };

Periods _$PeriodsFromJson(Map<String, dynamic> json) => Periods(
      first: json['first'] as int?,
      second: json['second'] as int?,
    );

Map<String, dynamic> _$PeriodsToJson(Periods instance) => <String, dynamic>{
      'first': instance.first,
      'second': instance.second,
    };

Venue _$VenueFromJson(Map<String, dynamic> json) => Venue(
      id: json['id'] as int,
      name: json['name'] as String,
      city: json['city'] as String,
    );

Map<String, dynamic> _$VenueToJson(Venue instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'city': instance.city,
    };

Status _$StatusFromJson(Map<String, dynamic> json) => Status(
      long: json['long'] as String,
      short: json['short'] as String,
      elapsed: json['elapsed'] as int?,
    );

Map<String, dynamic> _$StatusToJson(Status instance) => <String, dynamic>{
      'long': instance.long,
      'short': instance.short,
      'elapsed': instance.elapsed,
    };

League _$LeagueFromJson(Map<String, dynamic> json) => League(
      id: json['id'] as int,
      name: json['name'] as String,
      country: json['country'] as String,
      logo: json['logo'] as String,
      flag: json['flag'] as String,
      season: json['season'] as int,
      round: json['round'] as String,
    );

Map<String, dynamic> _$LeagueToJson(League instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'country': instance.country,
      'logo': instance.logo,
      'flag': instance.flag,
      'season': instance.season,
      'round': instance.round,
    };

Teams _$TeamsFromJson(Map<String, dynamic> json) => Teams(
      home: Team.fromJson(json['home'] as Map<String, dynamic>),
      away: Team.fromJson(json['away'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TeamsToJson(Teams instance) => <String, dynamic>{
      'home': instance.home.toJson(),
      'away': instance.away.toJson(),
    };

Team _$TeamFromJson(Map<String, dynamic> json) => Team(
      id: json['id'] as int,
      name: json['name'] as String,
      logo: json['logo'] as String,
      winner: json['winner'] as bool?,
    );

Map<String, dynamic> _$TeamToJson(Team instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo': instance.logo,
      'winner': instance.winner,
    };

Goals _$GoalsFromJson(Map<String, dynamic> json) => Goals(
      home: json['home'] as int?,
      away: json['away'] as int?,
    );

Map<String, dynamic> _$GoalsToJson(Goals instance) => <String, dynamic>{
      'home': instance.home,
      'away': instance.away,
    };

Score _$ScoreFromJson(Map<String, dynamic> json) => Score(
      halftime: Goals.fromJson(json['halftime'] as Map<String, dynamic>),
      fulltime: Goals.fromJson(json['fulltime'] as Map<String, dynamic>),
      extratime: Goals.fromJson(json['extratime'] as Map<String, dynamic>),
      penalty: Goals.fromJson(json['penalty'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ScoreToJson(Score instance) => <String, dynamic>{
      'halftime': instance.halftime.toJson(),
      'fulltime': instance.fulltime.toJson(),
      'extratime': instance.extratime.toJson(),
      'penalty': instance.penalty.toJson(),
    };
