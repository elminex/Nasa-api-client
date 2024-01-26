import 'package:nasa_api_app/api/models/roverCamera/camera.dart';

// TODO probably could use enums here

const List<String> rovers = [
  'Curiosity',
  'Opportunity',
  'Spirit',
  'Perseverance'
];

const List<Camera> perseveranceCameras = [];
const List<Camera> cameras = [
  Camera(name: "All available cameras", value: 'all', availability: "cosp"),
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
  Camera(value: 'EDL_RUCAM', name: 'Rover Up-Look Camera', availability: "p"),
  Camera(value: 'EDL_RDCAM', name: 'Rover Down-Look Camera', availability: "p"),
  Camera(
      value: 'EDL_DDCAM',
      name: 'Descent Stage Down-Look Camera',
      availability: "p"),
  Camera(
      value: 'EDL_PUCAM1',
      name: 'Parachute Up-Look Camera A',
      availability: "p"),
  Camera(
      value: 'EDL_PUCAM2',
      name: 'Parachute Up-Look Camera B',
      availability: "p"),
  Camera(
      value: 'NAVCAM_LEFT',
      name: 'Navigation Camera - Left',
      availability: "p"),
  Camera(
      value: 'NAVCAM_RIGHT',
      name: 'Navigation Camera - Right',
      availability: "p"),
  Camera(
      value: 'MCZ_RIGHT', name: 'Mast Camera Zoom - Right', availability: "p"),
  Camera(value: 'MCZ_LEFT', name: 'Mast Camera Zoom - Left', availability: "p"),
  Camera(
      value: 'FRONT_HAZCAM_LEFT_A',
      name: 'Front Hazard Avoidance Camera - Left',
      availability: "p"),
  Camera(
      value: 'FRONT_HAZCAM_RIGHT_A',
      name: 'Front Hazard Avoidance Camera - Right',
      availability: "p"),
  Camera(
      value: 'REAR_HAZCAM_LEFT',
      name: 'Rear Hazard Avoidance Camera - Left',
      availability: "p"),
  Camera(
      value: 'REAR_HAZCAM_RIGHT',
      name: 'Rear Hazard Avoidance Camera - Right',
      availability: "p"),
  Camera(value: 'SKYCAM', name: 'MEDA Skycam', availability: "p"),
  Camera(
      value: 'SHERLOC_WATSON', name: 'SHERLOC WATSON Camera', availability: "p")
];

final List<MissionDate> missionEndDates = [
  MissionDate(rover: "curiosity", date: DateTime.now()),
  MissionDate(rover: "perseverance", date: DateTime.now()),
  MissionDate(rover: "opportunity", date: DateTime.parse('2019-03-12')),
  MissionDate(rover: "spirit", date: DateTime.parse('2011-05-24')),
];

final List<MissionDate> missionStartdates = [
  MissionDate(rover: "curiosity", date: DateTime.parse('2012-08-06')),
  MissionDate(rover: "opportunity", date: DateTime.parse('2004-01-25')),
  MissionDate(rover: "spirit", date: DateTime.parse('2003-06-10')),
  MissionDate(rover: "perseverance", date: DateTime.parse('2021-02-18'))
];

class MissionDate {
  final String rover;
  final DateTime date;

  MissionDate({required this.rover, required this.date});
}
