// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launches_rest_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _LaunchesRestClient implements LaunchesRestClient {
  _LaunchesRestClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'https://api.spacexdata.com/v3/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<Launch> getNextLaunch() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('launches/next',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Launch.fromJson(_result.data);
    return value;
  }

  @override
  Future<List<Launch>> getUpcomingLaunches() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>('launches/upcoming',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => Launch.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }
}
