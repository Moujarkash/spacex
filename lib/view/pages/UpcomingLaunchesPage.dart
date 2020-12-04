import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:spacex/blocs/UpcomingLaunchesBloc.dart';
import 'package:spacex/models/launch/launch.dart';
import 'package:spacex/view/widgets/error_view.dart';

class UpcomingLaunchesPage extends StatefulWidget {
  @override
  _UpcomingLaunchesPageState createState() => _UpcomingLaunchesPageState();
}

class _UpcomingLaunchesPageState extends State<UpcomingLaunchesPage> {
  final UpcomingLaunchesBloc _upcomingLaunchesBloc = UpcomingLaunchesBloc();

  @override
  void initState() {
    _upcomingLaunchesBloc.getUpcomingLaunches();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: StreamBuilder(
          stream: _upcomingLaunchesBloc.upcomingLaunches,
          builder: (context, AsyncSnapshot<List<Launch>> snapshot) {
            if (snapshot.hasError) {
              var message;
              if (snapshot.error is DioError)
                message = (snapshot.error as DioError).response.statusMessage;

              return Center(child: ErrorView(onRetry: () => _upcomingLaunchesBloc.getUpcomingLaunches(), message: message,),);
            } else if (snapshot.hasData) {
              return _getUpcomingLaunchesView(snapshot.data);
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  Widget _getUpcomingLaunchesView(List<Launch> launches) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      padding: const EdgeInsets.all(8),
      separatorBuilder: (context, index) => Divider(),
      itemCount: launches.length,
      itemBuilder: (context, index) {
        var launch = launches[index];
        return ListTile(
          leading: launch.links.missionPatchSmall != null && launch.links.missionPatchSmall.isNotEmpty ? CachedNetworkImage(
            imageUrl: launch.links.missionPatchSmall,
            width: 64,
            height: 64,
          ) : Icon(Icons.error, size: 64,),
          title: Text(launch.missionName),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(launch.rocket.rocketName),
              Text(launch.launchSite.siteName),
              Text(launch.launchDateLocalTime.toString())
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _upcomingLaunchesBloc.dispose();
    super.dispose();
  }
}
