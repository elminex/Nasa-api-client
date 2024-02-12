import 'dart:math';
import 'package:nasa_api_app/roverOptions/rover_options.dart';

DateTime? randomDateGenerator(Rovers roverName) {
  Rover opportunity = Rover(
      name: Rovers.opportunity,
      maxDate: missionEndDates
          .where((element) => element.rover == Rovers.opportunity)
          .first
          .date,
      minDate: missionStartdates
          .where((element) => element.rover == Rovers.opportunity)
          .first
          .date);
  Rover spirit = Rover(
      name: Rovers.spirit,
      maxDate: missionEndDates
          .where((element) => element.rover == Rovers.spirit)
          .first
          .date,
      minDate: missionStartdates
          .where((element) => element.rover == Rovers.spirit)
          .first
          .date);
  Rover curiosity = Rover(
      name: Rovers.curiosity,
      maxDate: missionEndDates
          .where((element) => element.rover == Rovers.curiosity)
          .first
          .date,
      minDate: missionStartdates
          .where((element) => element.rover == Rovers.curiosity)
          .first
          .date);
  Rover pervererance = Rover(
      name: Rovers.perseverance,
      maxDate: missionEndDates
          .where((element) => element.rover == Rovers.perseverance)
          .first
          .date,
      minDate: missionStartdates
          .where((element) => element.rover == Rovers.perseverance)
          .first
          .date);

  final DateTime randomDate = switch (roverName) {
    Rovers.opportunity => opportunity.getRandomDate(),
    Rovers.spirit => spirit.getRandomDate(),
    Rovers.curiosity => curiosity.getRandomDate(),
    Rovers.perseverance => pervererance.getRandomDate(),
  };
  return randomDate;
}

class Rover {
  final Rovers name;
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
