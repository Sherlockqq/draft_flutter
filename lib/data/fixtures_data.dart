import 'dart:convert';

import 'package:draft_flutter/domain/fixtures.dart';

FixturesData fixturesDataFromJson(String str) =>
    FixturesData.fromJson(json.decode(str));

class FixturesData {
  String get;
  Parameters parameters;
  List<dynamic> errors;
  int results;
  Paging paging;
  List<Response> response;

  FixturesData(
      {required this.get,
      required this.parameters,
      required this.errors,
      required this.results,
      required this.paging,
      required this.response});

  factory FixturesData.fromJson(Map<String, dynamic> json) => FixturesData(
      get: json['get'],
      parameters: Parameters.fromJson(json['parameters']),
      errors: List<dynamic>.from(json["errors"].map((x) => x)),
      results: json['results'],
      paging: Paging.fromJson(json['paging']),
      response: List<Response>.from(
          json["response"].map((x) => Response.fromJson(x))));

  Map<String, dynamic> toJson() => {
        "get": get,
        "parameters": parameters.toJson(),
        "errors": List<dynamic>.from(errors.map((x) => x)),
        "results": results,
        "paging": paging.toJson(),
        "response": List<dynamic>.from(response.map((x) => x.toJson())),
      };

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

class Parameters {
  String league;
  String season;

  Parameters({
    required this.league,
    required this.season,
  });

  factory Parameters.fromJson(Map<String, dynamic> json) =>
      Parameters(league: json['league'], season: json['season']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['league'] = league;
    data['season'] = season;
    return data;
  }
}

class Paging {
  int current;
  int total;

  Paging({required this.current, required this.total});

  factory Paging.fromJson(Map<String, dynamic> json) =>
      Paging(current: json['current'], total: json['total']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['current'] = current;
    data['total'] = total;
    return data;
  }
}

class Response {
  Fixture fixture;
  League league;
  Teams teams;
  Goals goals;
  Score score;

  Response(
      {required this.fixture,
      required this.league,
      required this.teams,
      required this.goals,
      required this.score});

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        fixture: Fixture.fromJson(json['fixture']),
        league: League.fromJson(json['league']),
        teams: Teams.fromJson(json['teams']),
        goals: Goals.fromJson(json['goals']),
        score: Score.fromJson(json['score']),
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['fixture'] = fixture.toJson();
    data['league'] = league.toJson();
    data['teams'] = teams.toJson();
    data['goals'] = goals.toJson();
    data['score'] = score.toJson();
    return data;
  }
}

class Fixture {
  int id;
  String? referee;
  String timezone;
  String date;
  int timestamp;
  Periods periods;
  Venue venue;
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

  factory Fixture.fromJson(Map<String, dynamic> json) => Fixture(
      id: json['id'],
      referee: json['referee'],
      timezone: json['timezone'],
      date: json['date'],
      timestamp: json['timestamp'],
      periods: Periods.fromJson(json['periods']),
      venue: Venue.fromJson(json['venue']),
      status: Status.fromJson(json['status']));

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['referee'] = referee;
    data['timezone'] = timezone;
    data['date'] = date;
    data['timestamp'] = timestamp;
    data['periods'] = periods.toJson();
    data['venue'] = venue.toJson();
    data['status'] = status.toJson();
    return data;
  }
}

class Periods {
  int? first;
  int? second;

  Periods({this.first, this.second});

  factory Periods.fromJson(Map<String, dynamic> json) => Periods(
        first: json['first'],
        second: json['second'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['first'] = first;
    data['second'] = second;
    return data;
  }
}

class Venue {
  int id;
  String name;
  String city;

  Venue({required this.id, required this.name, required this.city});

  factory Venue.fromJson(Map<String, dynamic> json) => Venue(
        id: json['id'],
        name: json['name'],
        city: json['city'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['city'] = city;
    return data;
  }
}

class Status {
  String long;
  String short;
  int? elapsed;

  Status({required this.long, required this.short, this.elapsed});

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        long: json['long'],
        short: json['short'],
        elapsed: json['elapsed'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['long'] = long;
    data['short'] = short;
    data['elapsed'] = elapsed;
    return data;
  }
}

class League {
  int id;
  String name;
  String country;
  String logo;
  String flag;
  int season;
  String round;

  League(
      {required this.id,
      required this.name,
      required this.country,
      required this.logo,
      required this.flag,
      required this.season,
      required this.round});

  factory League.fromJson(Map<String, dynamic> json) => League(
        id: json['id'],
        name: json['name'],
        country: json['country'],
        logo: json['logo'],
        flag: json['flag'],
        season: json['season'],
        round: json['round'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['country'] = country;
    data['logo'] = logo;
    data['flag'] = flag;
    data['season'] = season;
    data['round'] = round;
    return data;
  }
}

class Teams {
  Team home;
  Team away;

  Teams({required this.home, required this.away});

  factory Teams.fromJson(Map<String, dynamic> json) => Teams(
        home: Team.fromJson(json['home']),
        away: Team.fromJson(json['away']),
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['home'] = home.toJson();
    data['away'] = away.toJson();
    return data;
  }
}

class Team {
  int id;
  String name;
  String logo;
  bool? winner;

  Team({required this.id, required this.name, required this.logo, this.winner});

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        id: json['id'],
        name: json['name'],
        logo: json['logo'],
        winner: json['winner'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['logo'] = logo;
    data['winner'] = winner;
    return data;
  }
}

class Goals {
  int? home;
  int? away;

  Goals({this.home, this.away});

  factory Goals.fromJson(Map<String, dynamic> json) => Goals(
        home: json['home'],
        away: json['away'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['home'] = home;
    data['away'] = away;
    return data;
  }
}

class Score {
  Goals halftime;
  Goals fulltime;
  Goals extratime;
  Goals penalty;

  Score(
      {required this.halftime,
      required this.fulltime,
      required this.extratime,
      required this.penalty});

  factory Score.fromJson(Map<String, dynamic> json) => Score(
      halftime: Goals.fromJson(json['halftime']),
      fulltime: Goals.fromJson(json['fulltime']),
      extratime: Goals.fromJson(json['extratime']),
      penalty: Goals.fromJson(json['penalty']));

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['halftime'] = halftime.toJson();
    data['fulltime'] = fulltime.toJson();
    data['extratime'] = extratime.toJson();
    data['penalty'] = penalty.toJson();
    return data;
  }
}
