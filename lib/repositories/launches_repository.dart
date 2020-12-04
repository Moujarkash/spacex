import 'package:dio/dio.dart';
import 'package:spacex/models/launch/launch.dart';
import 'package:spacex/networking/launches/launches_rest_client.dart';

class LaunchesRepository {
  static LaunchesRepository _instance;
  LaunchesRestClient _launchesRestClient;

  LaunchesRepository._internal() {
    _launchesRestClient = LaunchesRestClient(Dio());
  }

  static LaunchesRepository get instance {
    if (_instance == null)
      _instance = LaunchesRepository._internal();

    return _instance;
  }

  Future<Launch> getNextLaunch() async {
    return await _launchesRestClient
        .getNextLaunch()
        .then((value) => value);
  }

  Future<List<Launch>> getUpcomingLaunches() async {
    return await _launchesRestClient
        .getUpcomingLaunches()
        .then((value) => value);
  }
}
