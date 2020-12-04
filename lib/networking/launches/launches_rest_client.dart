import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:spacex/helpers/constant.dart';
import 'package:spacex/models/launch/launch.dart';

part 'launches_rest_client.g.dart';

@RestApi(baseUrl: ENDPOINT_BASE_URL)
abstract class LaunchesRestClient {
  factory LaunchesRestClient(Dio dio, {String baseUrl}) = _LaunchesRestClient;

  @GET('launches/next')
  Future<Launch> getNextLaunch();

  @GET('launches/upcoming')
  Future<List<Launch>> getUpcomingLaunches();
}