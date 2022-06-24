import 'package:draft_flutter/data/fixtures_data.dart';
import 'package:draft_flutter/data/season_data.dart';
import 'package:draft_flutter/domain/fixtures.dart';
import 'package:equatable/equatable.dart';

abstract class RequestState extends Equatable {
  const RequestState();

  @override
  List<Object?> get props => [];
}

class Loading extends RequestState {}

class Empty extends RequestState {}

class Error extends RequestState {
  final String? message;
  const Error(this.message);
}

class SeasonSuccess extends RequestState {
  final int season;
  const SeasonSuccess(this.season);
}

class FixturesSuccess extends RequestState {
  final Map<int,List<MatchFixtures>> fixtures;
  const FixturesSuccess(this.fixtures);
}