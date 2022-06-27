import 'package:dio/dio.dart';
import 'package:draft_flutter/cubit/fixtures_cubit.dart';
import 'package:draft_flutter/domain/fixtures.dart';
import 'package:draft_flutter/domain/states.dart';
import 'package:draft_flutter/ui/fixtures/fixtures_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/fixtures_repository.dart';
import '../../data/retrofit/api_client.dart';

class FixturePage extends StatefulWidget {
  const FixturePage({Key? key, required this.season}) : super(key: key);

  final int season;

  @override
  State<FixturePage> createState() => _FixturePageState();
}

class _FixturePageState extends State<FixturePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<FixturesCubit>(
        create: (context) =>
            FixturesCubit(FixturesRepository(ApiClient(Dio())))..getFixtures(widget.season),
        child: Scaffold(
          body: _buildFixturesDisplay(context),
        ));
  }

  Widget _buildFixturesDisplay(BuildContext context) {
    return BlocBuilder<FixturesCubit, RequestState>(builder: (context, state) {
      if (state is Error) {
        return _buildError();
      } else if (state is Loading) {
        return _buildLoading();
      } else if (state is FixturesSuccess) {
        return _buildSuccess(state.fixtures);
      } else {
        return const Center(
          child: Text("No..."),
        );
      }
    });
  }

  Widget _buildError() => const Center(
        child: Text("Something went wrong..."),
      );

  Widget _buildLoading() => const Center(child: CircularProgressIndicator());

  Widget _buildSuccess(Map<int, List<MatchFixtures>> map) {
    return PageView.builder(
        itemCount: map.length,
        itemBuilder: (BuildContext context, int index) {
          var list = map[index + 1];
          if (list != null) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Icon(Icons.arrow_back),
                    Text("Gameweek ${index + 1}"),
                    const Icon(Icons.arrow_forward),
                  ],
                ),
                Expanded(child: FixturesListWidget(list: list)),
              ],
            );
          } else {
            return const Text("Something went wrong..");
          }
        });
  }
}
