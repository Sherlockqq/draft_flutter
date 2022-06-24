import 'package:draft_flutter/domain/fixtures.dart';
import 'package:draft_flutter/ui/fixtures/match_widget.dart';
import 'package:flutter/material.dart';

class FixturesListWidget extends StatelessWidget {
  const FixturesListWidget({Key? key, required this.list}) : super(key: key);

  final List<MatchFixtures> list;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return MatchWidget(match: list[index]);
      },
    );
  }
}