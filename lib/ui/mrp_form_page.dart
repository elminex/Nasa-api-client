import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nasa_api_app/bloc/mars_rover/cubit/mars_rover_cubit.dart';

import '../utils/random_date_generator.dart';

const List<String> rovers = ['Curiosity', 'Opportunity', 'Spirit'];
final List<Camera> cameras = [
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

List<DropdownMenuItem<String>>? _getCameras(selectedRover) {
  if (selectedRover == null) {
    return selectedRover;
  }
  String filterValue = switch (selectedRover) {
    "Opportunity" => "o",
    "Curiosity" => "c",
    "Spirit" => "s",
    _ => ''
  };
  Iterable<Camera> filteredCameras = cameras
      .where((camera) => camera.availability.characters.contains(filterValue));
  return filteredCameras
      .map<DropdownMenuItem<String>>((camera) =>
          DropdownMenuItem(value: camera.value, child: Text(camera.name)))
      .toList();
}

class MarsRoverFormPage extends StatefulWidget {
  const MarsRoverFormPage({super.key});

  @override
  State<MarsRoverFormPage> createState() => _MarsRoverFormPageState();
}

class _MarsRoverFormPageState extends State<MarsRoverFormPage> {
  final _formKey = GlobalKey<FormState>();
  String? roverSelectedValue;
  String cameraSelectedValue = "all";
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(children: [
        DropdownButtonFormField(
            hint: const Text("Select Mars Rover"),
            validator: (value) => value == null ? "Select Mars Rover" : null,
            value: roverSelectedValue,
            items: rovers
                .map<DropdownMenuItem<String>>((rover) =>
                    DropdownMenuItem(value: rover, child: Text(rover)))
                .toList(),
            onChanged: (String? value) {
              setState(() => roverSelectedValue = value);
            }),
        DropdownButtonFormField(
            hint: const Text("Select Mars Rover Camera(optional)"),
            disabledHint: const Text("First select Rover"),
            value: cameraSelectedValue,
            items: _getCameras(roverSelectedValue),
            onChanged: (String? value) {
              setState(() => cameraSelectedValue = value!);
            }),
        Row(
          children: [
            ElevatedButton(
                onPressed: () {
                  if (roverSelectedValue == null) {
                    showMyDialog(context);
                  }
                  DateTime? date = randomDateGenerator(roverSelectedValue!);
                  if (date != null) setState(() => selectedDate = date);
                },
                child: const Text("Random date")),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text("${selectedDate.toLocal()}".split(' ')[0]),
                const SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                  onPressed: () => _selectDate(context),
                  child: const Text('Select date'),
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                final String requestYear = selectedDate.year.toString();
                final String requestMonth = selectedDate.month.toString();
                final String requestDay = selectedDate.day.toString();
                context.read<MarsRoverCubit>().getRoverPhoto(
                    roverSelectedValue!,
                    '$requestYear-$requestMonth-$requestDay',
                    cameraSelectedValue);
                context.go('/mrp/photos');
              }
            },
            child: const Text('Show Photos'),
          ),
        ),
      ]),
    );
  }
}

class Camera {
  final String name;
  final String value;
  final String availability;

  Camera({required this.name, required this.value, required this.availability});
}

void showMyDialog(context) {
  showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      content: const Text(
        "Select Rover first",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(ctx).pop();
          },
          child: const Text(
            "GO back",
            style: TextStyle(color: Colors.cyan, fontSize: 17),
          ),
        ),
      ],
    ),
  );
}
