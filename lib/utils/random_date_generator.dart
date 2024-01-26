import 'dart:math';
import 'package:nasa_api_app/roverOptions/rover_options.dart';

DateTime? randomDateGenerator(String roverName) {
  Rover opportunity = Rover(
      name: "Opportunity",
      maxDate: missionEndDates
          .where((element) => element.rover == "opportunity")
          .first
          .date,
      minDate: missionStartdates
          .where((element) => element.rover == "opportunity")
          .first
          .date);
  Rover spirit = Rover(
      name: "Spirit",
      maxDate: missionEndDates
          .where((element) => element.rover == "spirit")
          .first
          .date,
      minDate: missionStartdates
          .where((element) => element.rover == "spirit")
          .first
          .date);
  Rover curiosity = Rover(
      name: "Curiosity",
      maxDate: missionEndDates
          .where((element) => element.rover == "curiosity")
          .first
          .date,
      minDate: missionStartdates
          .where((element) => element.rover == "curiosity")
          .first
          .date);
  Rover pervererance = Rover(
      name: "Perseverance",
      maxDate: missionEndDates
          .where((element) => element.rover == "perseverance")
          .first
          .date,
      minDate: missionStartdates
          .where((element) => element.rover == "perseverance")
          .first
          .date);

  final DateTime? randomDate = switch (roverName) {
    "Opportunity" => opportunity.getRandomDate(),
    "Spirit" => spirit.getRandomDate(),
    "Curiosity" => curiosity.getRandomDate(),
    "Perseverance" => pervererance.getRandomDate(),
    _ => null
  };
  return randomDate;
}

class Rover {
  final String name;
  final DateTime maxDate;
  final DateTime minDate;

  Rover({required this.maxDate, required this.minDate, required this.name});

  DateTime getRandomDate() {
    int randomDate = (minDate.millisecondsSinceEpoch +
            (Random().nextDouble() *
                (maxDate.millisecondsSinceEpoch -
                    minDate.millisecondsSinceEpoch)))
        .round();
    return DateTime.fromMillisecondsSinceEpoch(randomDate);
  }
}
