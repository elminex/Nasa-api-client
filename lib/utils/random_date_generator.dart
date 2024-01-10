import 'dart:math';

DateTime? randomDateGenerator(String roverName) {
  Rover opportunity = Rover(
      name: "Opportunity",
      maxDate: DateTime.parse("2018-06-11"),
      minDate: DateTime.parse("2004-01-25"));
  Rover spirit = Rover(
      name: "Spirit",
      maxDate: DateTime.parse("2010-03-21"),
      minDate: DateTime.parse("2004-01-04"));
  Rover curiosity = Rover(
      name: "Curiosity",
      maxDate: DateTime.now(),
      minDate: DateTime.parse("2012-08-06"));

  final DateTime? randomDate = switch (roverName) {
    "Opportunity" => opportunity.getRandomDate(),
    "Spirit" => spirit.getRandomDate(),
    "Curiosity" => curiosity.getRandomDate(),
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
