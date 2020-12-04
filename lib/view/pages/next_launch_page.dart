import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:spacex/blocs/next_launch_bloc.dart';
import 'package:spacex/models/launch/launch.dart';
import 'package:spacex/view/widgets/error_view.dart';

class NextLaunchPage extends StatefulWidget {
  @override
  _NextLaunchPageState createState() => _NextLaunchPageState();
}

class _NextLaunchPageState extends State<NextLaunchPage> {
  final NextLaunchBloc _nextLaunchBloc = NextLaunchBloc();

  @override
  void initState() {
    _nextLaunchBloc.getNextLaunch();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: StreamBuilder(
          stream: _nextLaunchBloc.nextLaunch,
          builder: (context, AsyncSnapshot<Launch> snapshot) {
            if (snapshot.hasError) {
              var message;
              if (snapshot.error is DioError)
                message = (snapshot.error as DioError).response.statusMessage;

              return Center(child: ErrorView(onRetry: () => _nextLaunchBloc.getNextLaunch(), message: message,),);
            } else if (snapshot.hasData) {
              return _getLaunchView(snapshot.data);
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  Widget _getLaunchView(Launch launch) {
    var durationToLaunch = launch.launchDateUnix.difference(DateTime.now());
    var dateTimeToLaunch = DateTime.now().add(durationToLaunch);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: CachedNetworkImage(
            imageUrl: launch.links.missionPatch,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
            width: 200,
            height: 200,
          ),
        ),
        const SizedBox(height: 16,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Mission: ", style: TextStyle(fontSize: 18),),
            const SizedBox(width: 8,),
            Text(launch.missionName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
          ],
        ),
        const SizedBox(height: 8,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Rocket: ", style: TextStyle(fontSize: 18),),
            const SizedBox(width: 8,),
            Text(launch.rocket.rocketName, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Colors.blue),),
          ],
        ),
        const SizedBox(height: 16,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Launch In: ', style: TextStyle(fontSize: 18),),
            const SizedBox(width: 8,),
            CountdownTimer(
              endTime: dateTimeToLaunch.millisecondsSinceEpoch,
              widgetBuilder: (_, CurrentRemainingTime time) {
                if (time == null)
                  return Text(
                    '00:00:00', style: TextStyle(fontSize: 14, color: Colors.green),);

                var hours = time.hours?? 0;

                if (time.days != null)
                  hours += time.days * 24;
                return Text(
                  '${hours != null && hours < 10 ? 0 : ''}${hours != null ? hours : '00'}:${time.min != null && time.min < 10 ? 0 : ''}${time.min != null ? time.min : '00'}:${time.sec != null && time.sec < 10 ? 0 : ''}${time.sec}', style: TextStyle(fontSize: 14, color: (time.min != null && time.min < 5 || time.min == null) ? Colors.red : Colors.blue),);
              },
            ),
          ],
        ),
      ],
    );
  }

  @override
  void dispose() {
    _nextLaunchBloc.dispose();
    super.dispose();
  }
}
