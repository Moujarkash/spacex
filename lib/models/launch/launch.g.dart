// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Launch _$LaunchFromJson(Map<String, dynamic> json) {
  return Launch()
    ..flightNumber = json['flight_number'] as int
    ..missionName = json['mission_name'] as String
    ..missionId =
        (json['mission_id'] as List)?.map((e) => e as String)?.toList()
    ..launchYear = JsonHelper.getIntValueFromJson(json['launch_year'] as String)
    ..launchDateUnix =
        JsonHelper.getDateUnixFromJson(json['launch_date_unix'] as int)
    ..launchDateUtc =
        JsonHelper.getDateUtcFromJsonString(json['launch_date_utc'] as String)
    ..launchDateLocalTime =
        JsonHelper.getDateFromJsonString(json['launch_date_local'] as String)
    ..rocket = json['rocket'] == null
        ? null
        : Rocket.fromJson(json['rocket'] as Map<String, dynamic>)
    ..launchSite = json['launch_site'] == null
        ? null
        : LaunchSite.fromJson(json['launch_site'] as Map<String, dynamic>)
    ..links = json['links'] == null
        ? null
        : Links.fromJson(json['links'] as Map<String, dynamic>);
}

Map<String, dynamic> _$LaunchToJson(Launch instance) => <String, dynamic>{
      'flight_number': instance.flightNumber,
      'mission_name': instance.missionName,
      'mission_id': instance.missionId,
      'launch_year': JsonHelper.convertIntToJson(instance.launchYear),
      'launch_date_unix':
          JsonHelper.convertDateUnixToJson(instance.launchDateUnix),
      'launch_date_utc':
          JsonHelper.convertDateUtcToJsonString(instance.launchDateUtc),
      'launch_date_local':
          JsonHelper.convertDateToJsonString(instance.launchDateLocalTime),
      'rocket': instance.rocket,
      'launch_site': instance.launchSite,
      'links': instance.links,
    };

Rocket _$RocketFromJson(Map<String, dynamic> json) {
  return Rocket(
    json['rocket_id'] as String,
    json['rocket_name'] as String,
    json['rocket_type'] as String,
  );
}

Map<String, dynamic> _$RocketToJson(Rocket instance) => <String, dynamic>{
      'rocket_id': instance.rocketId,
      'rocket_name': instance.rocketName,
      'rocket_type': instance.rocketType,
    };

LaunchSite _$LaunchSiteFromJson(Map<String, dynamic> json) {
  return LaunchSite(
    json['site_id'] as String,
    json['site_name'] as String,
    json['site_name_long'] as String,
  );
}

Map<String, dynamic> _$LaunchSiteToJson(LaunchSite instance) =>
    <String, dynamic>{
      'site_id': instance.siteId,
      'site_name': instance.siteName,
      'site_name_long': instance.siteNameLong,
    };

Links _$LinksFromJson(Map<String, dynamic> json) {
  return Links(
    json['mission_patch'] as String,
    json['mission_patch_small'] as String,
  );
}

Map<String, dynamic> _$LinksToJson(Links instance) => <String, dynamic>{
      'mission_patch': instance.missionPatch,
      'mission_patch_small': instance.missionPatchSmall,
    };
