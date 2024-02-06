import 'package:nasa_api_app/roverOptions/rover_options.dart';

DateTime setDate(List<MissionDate> dateList, String? roverSelectedValue) {
  switch (roverSelectedValue) {
    case "Opportunity":
      return dateList
          .where((element) => element.rover == "opportunity")
          .first
          .date;
    case "Spirit":
      return dateList.where((element) => element.rover == "spirit").first.date;
    case "Curiosity":
      return dateList
          .where((element) => element.rover == "curiosity")
          .first
          .date;
    case "Perseverance":
      return dateList
          .where((element) => element.rover == "perseverance")
          .first
          .date;
  }
  throw ArgumentError.notNull("Not a rover");
}
