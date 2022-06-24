import 'package:draft_flutter/cubit/fixtures_cubit.dart';
import 'package:draft_flutter/data/fixtures_repository.dart';
import 'package:draft_flutter/domain/states.dart';
import 'package:draft_flutter/ui/fixtures/fixtures_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FixturesScreen extends StatefulWidget {
  const FixturesScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FixturesScreen();
  }
}

class _FixturesScreen extends State<FixturesScreen> {
  final PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FixturesCubit>(
        create: (context) =>
            FixturesCubit(FixturesRepository())..getCurrentSeason(),
        child: Scaffold(
            appBar: AppBar(
              title: const Text("Fixtures"),
            ),
            body: _buildSeasonDisplay(context)));

  }

  Widget _buildSeasonDisplay(BuildContext context) {
    return BlocBuilder<FixturesCubit, RequestState>(builder: (context, state) {
      if (state is Error) {
        return _buildError();
      } else if (state is Loading) {
        return _buildLoading();
      } else if (state is SeasonSuccess) {
        return FixturePage(season: state.season);
      } else {
        return Container();
      }
    });
  }

  Widget _buildError() => const Center(
        child: Text("Something went wrong..."),
      );

  Widget _buildLoading() => const Center(child: CircularProgressIndicator());
}
