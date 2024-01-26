import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nasa_api_app/bloc/mars_rover/cubit/mars_rover_cubit.dart';
import 'package:nasa_api_app/roverOptions/rover_options.dart';
import 'package:nasa_api_app/utils/get_cameras.dart';
import 'package:nasa_api_app/utils/show_my_dialog.dart';

import '../utils/random_date_generator.dart';

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

  DateTime _setDate(List<MissionDate> dateList) {
    switch (roverSelectedValue) {
      case "Opportunity":
        return dateList
            .where((element) => element.rover == "opportunity")
            .first
            .date;
      case "Spirit":
        return dateList
            .where((element) => element.rover == "spirit")
            .first
            .date;
      case "Curiosity":
        return dateList
            .where((element) => element.rover == "curiosity")
            .first
            .date;
      case "Perseverance":
        return dateList
            .where((element) => element.rover == "perseverance")
            .first
            .date;
    }
    throw ArgumentError.notNull("Not a rover");
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _setDate(missionEndDates),
      firstDate: _setDate(missionStartdates),
      lastDate: _setDate(missionEndDates),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: const AssetImage('lib/images/mars_With_rover.jpeg'),
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.8),
            BlendMode.srcOver,
          ),
        ),
      ),
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Text(
                'Mars Rover Api',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Text(
                  'This API is designed to collect image data gathered by NASA\'s Curiosity, Opportunity, and Spirit rovers on Mars and make it more easily available to other developers, educators, and citizen scientists. This API is maintained by Chris Cerami.'),
            ),
            DropdownButtonFormField(
                padding: const EdgeInsets.only(bottom: 16),
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 0,
                  ),
                  labelText: "Select Mars Rover",
                ),
                hint: const Text("Select Mars Rover"),
                validator: (value) =>
                    value == null ? "Select Mars Rover" : null,
                value: roverSelectedValue,
                items: rovers
                    .map<DropdownMenuItem<String>>((rover) =>
                        DropdownMenuItem(value: rover, child: Text(rover)))
                    .toList(),
                onChanged: (String? value) {
                  setState(() {
                    roverSelectedValue = value;
                    selectedDate = _setDate(missionEndDates);
                  });
                }),
            DropdownButtonFormField(
                padding: const EdgeInsets.only(bottom: 16),
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 0,
                  ),
                  labelText: "Select Rover Camera",
                ),
                isExpanded: true,
                hint: const Text("Select Mars Rover Camera(optional)"),
                disabledHint: const Text("First select Rover"),
                value: cameraSelectedValue,
                items: getCameras(roverSelectedValue),
                onChanged: (String? value) {
                  setState(() => cameraSelectedValue = value!);
                }),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    'Selected date: ${selectedDate.toLocal().toString().split(' ')[0]}',
                    style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextButton(
                      onPressed: () => _selectDate(context),
                      child: const Text('Select date'),
                    ),
                    const SizedBox(width: 20),
                    TextButton(
                      onPressed: () {
                        if (roverSelectedValue == null) {
                          showMyDialog(context, "Select Rover first");
                        } else {
                          DateTime? date =
                              randomDateGenerator(roverSelectedValue!);
                          if (date != null) setState(() => selectedDate = date);
                        }
                      },
                      child: const Text("Random date"),
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
                    final String formattedDate =
                        '$requestYear-$requestMonth-$requestDay';
                    context.read<MarsRoverCubit>().getRoverPhoto(
                        roverSelectedValue!,
                        formattedDate,
                        cameraSelectedValue);
                    context.goNamed('mrp-photos', pathParameters: {
                      'date': formattedDate,
                      'rover': roverSelectedValue!,
                      'cameras': cameras
                          .where(
                              (element) => element.value == cameraSelectedValue)
                          .first
                          .name
                    });
                  }
                },
                child: const Text('Show Photos'),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
