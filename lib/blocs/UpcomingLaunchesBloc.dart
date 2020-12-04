import 'package:rxdart/rxdart.dart';
import 'package:spacex/models/launch/launch.dart';
import 'package:spacex/repositories/launches_repository.dart';

class UpcomingLaunchesBloc {
  final PublishSubject<List<Launch>> _upcomingLaunches = PublishSubject<List<Launch>>();
  PublishSubject<List<Launch>> get upcomingLaunches => _upcomingLaunches;

  void getUpcomingLaunches() {
    LaunchesRepository.instance.getUpcomingLaunches()
        .then((value) => _upcomingLaunches.sink.add(value))
        .catchError((Object obj) {
      _upcomingLaunches.sink.addError(obj);
    });
  }

  void dispose() {
    _upcomingLaunches.close();
  }
}