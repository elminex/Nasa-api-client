import 'package:flutter/material.dart';
import 'package:nasa_api_app/api/models/roverCamera/camera.dart';
import 'package:nasa_api_app/roverOptions/rover_options.dart';

List<DropdownMenuItem<String>>? getCameras(Rovers? selectedRover) {
  if (selectedRover == null) {
    return null;
  }
  String filterValue = switch (selectedRover) {
    Rovers.opportunity => "o",
    Rovers.curiosity => "c",
    Rovers.spirit => "s",
    Rovers.perseverance => 'p',
  };
  Iterable<Camera> filteredCameras = cameras
      .where((camera) => camera.availability.characters.contains(filterValue));
  return filteredCameras
      .map<DropdownMenuItem<String>>((camera) =>
          DropdownMenuItem(value: camera.value, child: Text(camera.name)))
      .toList();
}
