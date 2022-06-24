class MatchFixtures {
  MatchFixtures(
      {required this.id,
        required this.round,
      required this.home,
      required this.homeLogo,
      this.homeGoals,
      required this.away,
      required this.awayLogo,
      this.awayGoals,
      required this.date});

  int id;
  int round;
  String home;
  String homeLogo;
  int? homeGoals;
  String away;
  String awayLogo;
  int? awayGoals;
  String date;
}
