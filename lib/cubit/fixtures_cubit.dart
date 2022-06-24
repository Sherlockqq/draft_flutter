import 'package:draft_flutter/data/fixtures_repository.dart';
import 'package:draft_flutter/domain/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FixturesCubit extends Cubit<RequestState> {
  FixturesCubit(this._fixturesRepository) : super(Empty());

  final FixturesRepository _fixturesRepository;

  Future<void> getCurrentSeason() async {
    try {
      emit(Loading());

      final season = await _fixturesRepository.fetchCurrentSeason();

      if (season == null) {
        emit(Empty());
      } else {
        emit(SeasonSuccess(season));
      }
    } catch (e) {
      emit(Error(e.toString()));
    }
  }


  void getFixtures(int season) async {
    try {
      emit(Loading());
      final fixtures = await _fixturesRepository.fetchFixtures(season);
      await Future<void>.delayed(const Duration(milliseconds: 50));

      if(fixtures == null) {
        emit(Empty());
      } else {
        emit(FixturesSuccess(fixtures));
      }
    } catch (e) {
      emit(Error(e.toString()));
    }
  }

}
