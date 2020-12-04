import 'package:json_annotation/json_annotation.dart';
import 'package:spacex/helpers/json_helper.dart';

part 'launch.g.dart';

@JsonSerializable()
class Launch {
  @JsonKey(name: 'flight_number')
  int flightNumber;
  @JsonKey(name: 'mission_name')
  String missionName;
  @JsonKey(name: 'mission_id')
  List<String> missionId;
  @JsonKey(name: 'launch_year', fromJson: JsonHelper.getIntValueFromJson, toJson: JsonHelper.convertIntToJson)
  int launchYear;
  @JsonKey(name: 'launch_date_unix', fromJson: JsonHelper.getDateUnixFromJson, toJson: JsonHelper.convertDateUnixToJson)
  DateTime launchDateUnix;
  @JsonKey(name: 'launch_date_utc', fromJson: JsonHelper.getDateUtcFromJsonString, toJson: JsonHelper.convertDateUtcToJsonString)
  DateTime launchDateUtc;
  @JsonKey(name: 'launch_date_local', fromJson: JsonHelper.getDateFromJsonString, toJson: JsonHelper.convertDateToJsonString)
  DateTime launchDateLocalTime;
  Rocket rocket;
  @JsonKey(name: 'launch_site')
  LaunchSite launchSite;
  Links links;

  Launch(
      this.flightNumber,
      this.missionName,
      this.missionId,
      this.launchYear,
      this.launchDateUnix,
      this.launchDateUtc,
      this.launchDateLocalTime,
      this.rocket,
      this.launchSite,
      this.links);

  factory Launch.fromJson(Map<String, dynamic> json) => _$LaunchFromJson(json);

  Map<String, dynamic> toJson() => _$LaunchToJson(this);
}

@JsonSerializable()
class Rocket {
  @JsonKey(name: 'rocket_id')
  String rocketId;
  @JsonKey(name: 'rocket_name')
  String rocketName;
  @JsonKey(name: 'rocket_type')
  String rocketType;

  Rocket(this.rocketId, this.rocketName, this.rocketType);

  factory Rocket.fromJson(Map<String, dynamic> json) => _$RocketFromJson(json);

  Map<String, dynamic> toJson() => _$RocketToJson(this);
}

@JsonSerializable()
class LaunchSite {
  @JsonKey(name: 'site_id')
  String siteId;
  @JsonKey(name: 'site_name')
  String siteName;
  @JsonKey(name: 'site_name_long')
  String siteNameLong;

  LaunchSite(this.siteId, this.siteName, this.siteNameLong);

  factory LaunchSite.fromJson(Map<String, dynamic> json) => _$LaunchSiteFromJson(json);

  Map<String, dynamic> toJson() => _$LaunchSiteToJson(this);
}

@JsonSerializable()
class Links {
  @JsonKey(name: 'mission_patch')
  String missionPatch;
  @JsonKey(name: 'mission_patch_small')
  String missionPatchSmall;

  Links(this.missionPatch, this.missionPatchSmall);

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);

  Map<String, dynamic> toJson() => _$LinksToJson(this);
}