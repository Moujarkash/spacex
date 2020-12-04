import 'package:rxdart/rxdart.dart';
import 'package:spacex/models/launch/launch.dart';
import 'package:spacex/repositories/launches_repository.dart';

class NextLaunchBloc {
  final PublishSubject<Launch> _nextLaunch = PublishSubject<Launch>();
  PublishSubject<Launch> get nextLaunch => _nextLaunch;

  void getNextLaunch() {
    LaunchesRepository.instance.getNextLaunch()
        .then((value) => _nextLaunch.sink.add(value))
        .catchError((Object obj) {
      _nextLaunch.sink.addError(obj);
    });
  }

  void dispose() {
    _nextLaunch.close();
  }
}