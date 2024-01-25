import 'package:nasa_api_app/api/models/roverCamera/camera.dart';

// TODO probably could use enums here

const List<String> rovers = ['Curiosity', 'Opportunity', 'Spirit'];
const List<Camera> cameras = [
  Camera(name: "All available cameras", value: 'all', availability: "cos"),
  Camera(
      name: "Front Hazard Avoidance Camera",
      value: "FHAZ",
      availability: "cos"),
  Camera(
      name: "Rear Hazard Avoidance Camera", value: "RHAZ", availability: "cos"),
  Camera(name: "Navigation Camera", value: "NAVCAM", availability: "cos"),
  Camera(name: "Mast Camera", value: "MAST", availability: "c"),
  Camera(
      name: "Chemistry and Camera Complex",
      value: "CHEMCAM",
      availability: "c"),
  Camera(name: "Mars Hand Lens Imager", value: "MAHLI", availability: "c"),
  Camera(name: "Mars Descent Images", value: "MARDI", availability: "c"),
  Camera(name: "Panoramic Camera", value: "PANCAM", availability: "os"),
  Camera(
      name: "Miniature Thermal Emission Spectrometer (Mini-TES)",
      value: "MINITES",
      availability: "os"),
];

final List<MissionDate> missionEndDates = [
  MissionDate(rover: "curiosity", date: DateTime.now()),
  MissionDate(rover: "opportunity", date: DateTime.parse('2019-03-12')),
  MissionDate(rover: "spirit", date: DateTime.parse('2011-05-24')),
];

final List<MissionDate> missionStartdates = [
  MissionDate(rover: "curiosity", date: DateTime.parse('2012-08-06')),
  MissionDate(rover: "opportynity", date: DateTime.parse('2004-01-25')),
  MissionDate(rover: "spirit", date: DateTime.parse('2003-06-10')),
];

class MissionDate {
  final String rover;
  final DateTime date;

  MissionDate({required this.rover, required this.date});
}
