import 'dart:convert';

import 'package:draft_flutter/domain/fixtures.dart';
import 'package:json_annotation/json_annotation.dart';

part 'fixtures_data.g.dart';

FixturesData fixturesDataFromJson(String str) =>
    FixturesData.fromJson(json.decode(str));

@JsonSerializable(explicitToJson: true)
class FixturesData {
  @JsonKey(name: 'get')
  String get;
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

  FixturesData(
      {required this.get,
      required this.parameters,
      required this.errors,
      required this.results,
      required this.paging,
      required this.response});

  factory FixturesData.fromJson(Map<String, dynamic> json) =>
      _$FixturesDataFromJson(json);

  Map<String, dynamic> toJson() => _$FixturesDataToJson(this);

  Map<int, List<MatchFixtures>> getListMatchFixturesFromFixturesData() {
    var map = <int, List<MatchFixtures>>{};
    int roundCounter = 1;
    var list = <MatchFixtures>[];

    for (var element in response) {
      if (roundCounter != getRound(element.league.round)) {
        var tourList = List<MatchFixtures>.from(list);
        map[roundCounter] = tourList;
        list.clear();
        roundCounter++;
      }
      list.add(MatchFixtures(
          id: element.fixture.id,
          round: roundCounter,
          home: element.teams.home.name,
          homeLogo: element.teams.home.logo,
          homeGoals: element.goals.home,
          away: element.teams.away.name,
          awayLogo: element.teams.away.logo,
          awayGoals: element.goals.away,
          date: element.fixture.date));
    }
    map[roundCounter] = list;
    return map;
  }

  int getRound(String value) =>
      int.parse(value.substring(value.length - 2, value.length).trim());
}

@JsonSerializable()
class Parameters {
  @JsonKey(name: 'league')
  String league;
  @JsonKey(name: 'season')
  String season;

  Parameters({
    required this.league,
    required this.season,
  });

  factory Parameters.fromJson(Map<String, dynamic> json) =>
      _$ParametersFromJson(json);

  Map<String, dynamic> toJson() => _$ParametersToJson(this);
}

@JsonSerializable()
class Paging {
  @JsonKey(name: 'current')
  int current;
  @JsonKey(name: 'total')
  int total;

  Paging({required this.current, required this.total});

  factory Paging.fromJson(Map<String, dynamic> json) => _$PagingFromJson(json);

  Map<String, dynamic> toJson() => _$PagingToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Response {
  @JsonKey(name: 'fixture')
  Fixture fixture;
  @JsonKey(name: 'league')
  League league;
  @JsonKey(name: 'teams')
  Teams teams;
  @JsonKey(name: 'goals')
  Goals goals;
  @JsonKey(name: 'score')
  Score score;

  Response(
      {required this.fixture,
      required this.league,
      required this.teams,
      required this.goals,
      required this.score});

  factory Response.fromJson(Map<String, dynamic> json) =>
      _$ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Fixture {
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'referee')
  String? referee;
  @JsonKey(name: 'timezone')
  String timezone;
  @JsonKey(name: 'date')
  String date;
  @JsonKey(name: 'timestamp')
  int timestamp;
  @JsonKey(name: 'periods')
  Periods periods;
  @JsonKey(name: 'venue')
  Venue venue;
  @JsonKey(name: 'status')
  Status status;

  Fixture(
      {required this.id,
      this.referee,
      required this.timezone,
      required this.date,
      required this.timestamp,
      required this.periods,
      required this.venue,
      required this.status});

  factory Fixture.fromJson(Map<String, dynamic> json) =>
      _$FixtureFromJson(json);

  Map<String, dynamic> toJson() => _$FixtureToJson(this);
}

@JsonSerializable()
class Periods {
  @JsonKey(name: 'first')
  int? first;
  @JsonKey(name: 'second')
  int? second;

  Periods({this.first, this.second});

  factory Periods.fromJson(Map<String, dynamic> json) =>
      _$PeriodsFromJson(json);

  Map<String, dynamic> toJson() => _$PeriodsToJson(this);
}

@JsonSerializable()
class Venue {
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'city')
  String city;

  Venue({required this.id, required this.name, required this.city});

  factory Venue.fromJson(Map<String, dynamic> json) => _$VenueFromJson(json);

  Map<String, dynamic> toJson() => _$VenueToJson(this);
}

@JsonSerializable()
class Status {
  @JsonKey(name: 'long')
  String long;
  @JsonKey(name: 'short')
  String short;
  @JsonKey(name: 'elapsed')
  int? elapsed;

  Status({required this.long, required this.short, this.elapsed});

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);

  Map<String, dynamic> toJson() => _$StatusToJson(this);
}

@JsonSerializable()
class League {
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'country')
  String country;
  @JsonKey(name: 'logo')
  String logo;
  @JsonKey(name: 'flag')
  String flag;
  @JsonKey(name: 'season')
  int season;
  @JsonKey(name: 'round')
  String round;

  League(
      {required this.id,
      required this.name,
      required this.country,
      required this.logo,
      required this.flag,
      required this.season,
      required this.round});

  factory League.fromJson(Map<String, dynamic> json) => _$LeagueFromJson(json);

  Map<String, dynamic> toJson() => _$LeagueToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Teams {
  @JsonKey(name: 'home')
  Team home;
  @JsonKey(name: 'away')
  Team away;

  Teams({required this.home, required this.away});

  factory Teams.fromJson(Map<String, dynamic> json) => _$TeamsFromJson(json);

  Map<String, dynamic> toJson() => _$TeamsToJson(this);
}

@JsonSerializable()
class Team {
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'logo')
  String logo;
  @JsonKey(name: 'winner')
  bool? winner;

  Team({required this.id, required this.name, required this.logo, this.winner});

  factory Team.fromJson(Map<String, dynamic> json) => _$TeamFromJson(json);

  Map<String, dynamic> toJson() => _$TeamToJson(this);
}

@JsonSerializable()
class Goals {
  @JsonKey(name: 'home')
  int? home;
  @JsonKey(name: 'away')
  int? away;

  Goals({this.home, this.away});

  factory Goals.fromJson(Map<String, dynamic> json) => _$GoalsFromJson(json);

  Map<String, dynamic> toJson() => _$GoalsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Score {
  @JsonKey(name: 'halftime')
  Goals halftime;
  @JsonKey(name: 'fulltime')
  Goals fulltime;
  @JsonKey(name: 'extratime')
  Goals extratime;
  @JsonKey(name: 'penalty')
  Goals penalty;

  Score(
      {required this.halftime,
      required this.fulltime,
      required this.extratime,
      required this.penalty});

  factory Score.fromJson(Map<String, dynamic> json) => _$ScoreFromJson(json);

  Map<String, dynamic> toJson() => _$ScoreToJson(this);
}
