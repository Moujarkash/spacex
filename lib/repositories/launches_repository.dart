import 'package:dio/dio.dart';
import 'package:spacex/models/launch/launch.dart';
import 'package:spacex/networking/launches/launches_rest_client.dart';
import 'package:spacex/repositories/base/base_repository.dart';

class LaunchesRepository extends BaseRepository {
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
        .then((value) => value)
        .catchError(catchError);
  }

  Future<List<Launch>> getUpcomingLaunches() async {
    return await _launchesRestClient
        .getUpcomingLaunches()
        .then((value) => value)
        .catchError(catchError);
  }
}
