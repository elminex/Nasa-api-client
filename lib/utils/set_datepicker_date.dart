import 'package:nasa_api_app/roverOptions/rover_options.dart';

DateTime setDate(List<MissionDate> dateList, Rovers? roverSelectedValue) {
  switch (roverSelectedValue) {
    case Rovers.opportunity:
      return dateList
          .where((element) => element.rover == Rovers.opportunity)
          .first
          .date;
    case Rovers.spirit:
      return dateList
          .where((element) => element.rover == Rovers.spirit)
          .first
          .date;
    case Rovers.curiosity:
      return dateList
          .where((element) => element.rover == Rovers.curiosity)
          .first
          .date;
    case Rovers.perseverance:
      return dateList
          .where((element) => element.rover == Rovers.perseverance)
          .first
          .date;
    case null:
      throw ArgumentError.notNull("Not a rover");
  }
}
