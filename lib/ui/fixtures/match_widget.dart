import 'package:draft_flutter/domain/fixtures.dart';
import 'package:flutter/material.dart';

class MatchWidget extends StatelessWidget {
  const MatchWidget({Key? key, required this.match}) : super(key: key);

  final MatchFixtures match;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
        child: Column(
          children: [
            Center(
              child: Text(match.date),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.network(
                  match.homeLogo,
                  width: 48,
                  height: 48,
                ),
                Text(match.home),
                match.homeGoals == null
                    ? const Text("? : ?")
                    : Text("${match.homeGoals} : ${match.awayGoals}"),
                Text(match.away),
                Image.network(
                  match.awayLogo,
                  width: 48,
                  height: 48,
                ),
              ],
            )
          ],
        ));
  }
}
