// To parse this JSON data, do
//
//     final seasonData = seasonDataFromJson(jsonString);

import 'dart:convert';

SeasonData seasonDataFromJson(String str) =>
    SeasonData.fromJson(json.decode(str));

String seasonDataToJson(SeasonData data) => json.encode(data.toJson());

class SeasonData {
  SeasonData({
    required this.seasonDataGet,
    required this.parameters,
    required this.errors,
    required this.results,
    required this.paging,
    required this.response,
  });

  String seasonDataGet;
  Parameters parameters;
  List<dynamic> errors;
  int results;
  Paging paging;
  List<Response> response;

  int getSeasonFromSeasonData() {
    return response[0].seasons[0].year;
  }

  factory SeasonData.fromJson(Map<String, dynamic> json) => SeasonData(
        seasonDataGet: json["get"],
        parameters: Parameters.fromJson(json["parameters"]),
        errors: List<dynamic>.from(json["errors"].map((x) => x)),
        results: json["results"],
        paging: Paging.fromJson(json["paging"]),
        response: List<Response>.from(
            json["response"].map((x) => Response.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "get": seasonDataGet,
        "parameters": parameters.toJson(),
        "errors": List<dynamic>.from(errors.map((x) => x)),
        "results": results,
        "paging": paging.toJson(),
        "response": List<dynamic>.from(response.map((x) => x.toJson())),
      };
}

class Paging {
  Paging({
    required this.current,
    required this.total,
  });

  int current;
  int total;

  factory Paging.fromJson(Map<String, dynamic> json) => Paging(
        current: json["current"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current": current,
        "total": total,
      };
}

class Parameters {
  Parameters({
    required this.id,
    required this.current,
  });

  String id;
  String current;

  factory Parameters.fromJson(Map<String, dynamic> json) => Parameters(
        id: json["id"],
        current: json["current"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "current": current,
      };
}

class Response {
  Response({
    required this.league,
    required this.country,
    required this.seasons,
  });

  League league;
  Country country;
  List<Season> seasons;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        league: League.fromJson(json["league"]),
        country: Country.fromJson(json["country"]),
        seasons:
            List<Season>.from(json["seasons"].map((x) => Season.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "league": league.toJson(),
        "country": country.toJson(),
        "seasons": List<dynamic>.from(seasons.map((x) => x.toJson())),
      };
}

class Country {
  Country({
    required this.name,
    required this.code,
    required this.flag,
  });

  String name;
  String code;
  String flag;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        name: json["name"],
        code: json["code"],
        flag: json["flag"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "code": code,
        "flag": flag,
      };
}

class League {
  League({
    required this.id,
    required this.name,
    required this.type,
    required this.logo,
  });

  int id;
  String name;
  String type;
  String logo;

  factory League.fromJson(Map<String, dynamic> json) => League(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        logo: json["logo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "logo": logo,
      };
}

class Season {
  Season({
    required this.year,
    required this.start,
    required this.end,
    required this.current,
    required this.coverage,
  });

  int year;
  DateTime start;
  DateTime end;
  bool current;
  Coverage coverage;

  factory Season.fromJson(Map<String, dynamic> json) => Season(
        year: json["year"],
        start: DateTime.parse(json["start"]),
        end: DateTime.parse(json["end"]),
        current: json["current"],
        coverage: Coverage.fromJson(json["coverage"]),
      );

  Map<String, dynamic> toJson() => {
        "year": year,
        "start":
            "${start.year.toString().padLeft(4, '0')}-${start.month.toString().padLeft(2, '0')}-${start.day.toString().padLeft(2, '0')}",
        "end":
            "${end.year.toString().padLeft(4, '0')}-${end.month.toString().padLeft(2, '0')}-${end.day.toString().padLeft(2, '0')}",
        "current": current,
        "coverage": coverage.toJson(),
      };
}

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

  Fixtures fixtures;
  bool standings;
  bool players;
  bool topScorers;
  bool topAssists;
  bool topCards;
  bool injuries;
  bool predictions;
  bool odds;

  factory Coverage.fromJson(Map<String, dynamic> json) => Coverage(
        fixtures: Fixtures.fromJson(json["fixtures"]),
        standings: json["standings"],
        players: json["players"],
        topScorers: json["top_scorers"],
        topAssists: json["top_assists"],
        topCards: json["top_cards"],
        injuries: json["injuries"],
        predictions: json["predictions"],
        odds: json["odds"],
      );

  Map<String, dynamic> toJson() => {
        "fixtures": fixtures.toJson(),
        "standings": standings,
        "players": players,
        "top_scorers": topScorers,
        "top_assists": topAssists,
        "top_cards": topCards,
        "injuries": injuries,
        "predictions": predictions,
        "odds": odds,
      };
}

class Fixtures {
  Fixtures({
    required this.events,
    required this.lineups,
    required this.statisticsFixtures,
    required this.statisticsPlayers,
  });

  bool events;
  bool lineups;
  bool statisticsFixtures;
  bool statisticsPlayers;

  factory Fixtures.fromJson(Map<String, dynamic> json) => Fixtures(
        events: json["events"],
        lineups: json["lineups"],
        statisticsFixtures: json["statistics_fixtures"],
        statisticsPlayers: json["statistics_players"],
      );

  Map<String, dynamic> toJson() => {
        "events": events,
        "lineups": lineups,
        "statistics_fixtures": statisticsFixtures,
        "statistics_players": statisticsPlayers,
      };
}
