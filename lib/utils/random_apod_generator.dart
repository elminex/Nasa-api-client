import "dart:math";

String getUrlOfRandomApod() {
  final int min = DateTime.parse("1995-05-16").millisecondsSinceEpoch;
  int max = DateTime.timestamp().millisecondsSinceEpoch;
  max = max - (5 * 60 * 60 * 1000);
  int randomDate = (min + (Random().nextDouble() * (max - min))).round();
  final int missingMin = DateTime.parse('1995-05-17').millisecondsSinceEpoch;
  final int missingMax =
      DateTime.parse('1995-05-19 23:59:59.999').millisecondsSinceEpoch;

  while (randomDate >= missingMin && randomDate <= missingMax) {
    randomDate = (min + (Random().nextDouble() * (max - min))).round();
  }
  final DateTime requestDate = DateTime.fromMillisecondsSinceEpoch(randomDate);
  final String requestYear = requestDate.year.toString();
  final String requestMonth = requestDate.month.toString();
  final String requestDay = requestDate.day.toString();
  return '$requestYear-$requestMonth-$requestDay';
}
