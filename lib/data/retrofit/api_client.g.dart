// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _ApiClient implements ApiClient {
  _ApiClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://v3.football.api-sports.io';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<SeasonData> getCurrentSeason(
      {leagueId = Apis.leagueId, isCurrent = true}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'id': leagueId,
      r'current': isCurrent
    };
    final _headers = <String, dynamic>{
      r'x-rapidapi-key': '40220fc8e6a6886380a261bcaea348c8',
      r'x-apisports-key': '40220fc8e6a6886380a261bcaea348c8',
      r'x-rapidapi-host': 'v3.football.api-sports.io'
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<SeasonData>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/leagues',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SeasonData.fromJson(_result.data!);
    return value;
  }

  @override
  Future<FixturesData> getFixtures(season, {leagueId = Apis.leagueId}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'season': season,
      r'league': leagueId
    };
    final _headers = <String, dynamic>{
      r'x-rapidapi-key': '40220fc8e6a6886380a261bcaea348c8',
      r'x-apisports-key': '40220fc8e6a6886380a261bcaea348c8',
      r'x-rapidapi-host': 'v3.football.api-sports.io'
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<FixturesData>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/fixtures',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = FixturesData.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
