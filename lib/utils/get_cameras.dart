import 'package:flutter/material.dart';
import 'package:nasa_api_app/api/models/roverCamera/camera.dart';
import 'package:nasa_api_app/roverOptions/rover_options.dart';

List<DropdownMenuItem<String>>? getCameras(selectedRover) {
  if (selectedRover == null) {
    return selectedRover;
  }
  String filterValue = switch (selectedRover) {
    "Opportunity" => "o",
    "Curiosity" => "c",
    "Spirit" => "s",
    "Perseverance" => 'p',
    _ => ''
  };
  Iterable<Camera> filteredCameras = cameras
      .where((camera) => camera.availability.characters.contains(filterValue));
  return filteredCameras
      .map<DropdownMenuItem<String>>((camera) =>
          DropdownMenuItem(value: camera.value, child: Text(camera.name)))
      .toList();
}
