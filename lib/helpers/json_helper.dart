class JsonHelper {
  static int getIntValueFromJson(String jsonValue) {
    if (jsonValue == null || jsonValue.isEmpty) return null;
    return int.parse(jsonValue);
  }

  static String convertIntToJson(int value) {
    if (value == null) return null;
    return value.toString();
  }

  static DateTime getDateUnixFromJson(int jsonValue) {
    if (jsonValue == null) return null;
    return DateTime.fromMillisecondsSinceEpoch(jsonValue * 1000);
  }

  static int convertDateUnixToJson(DateTime dateTime) {
    if (dateTime == null) return null;
    return dateTime.millisecondsSinceEpoch ~/ 1000;
  }

  static DateTime getDateFromJsonString(String dateTimeJson) {
    if (dateTimeJson == null || dateTimeJson.isEmpty) return null;

    return DateTime.parse(dateTimeJson);
  }

  static DateTime getDateUtcFromJsonString(String dateTimeJson) {
    if (dateTimeJson == null || dateTimeJson.isEmpty) return null;

    return DateTime.parse(dateTimeJson).toUtc();
  }

  static String convertDateToJsonString(DateTime dateTime) {
    if (dateTime == null) return null;
    return dateTime.toString();
  }

  static String convertDateUtcToJsonString(DateTime dateTime) {
    if (dateTime == null) return null;
    return dateTime.toUtc().toString();
  }
}