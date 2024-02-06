import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nasa_api_app/bloc/mars_rover/cubit/mars_rover_cubit.dart';
import 'package:nasa_api_app/roverOptions/rover_options.dart';
import 'package:nasa_api_app/utils/get_cameras.dart';
import 'package:nasa_api_app/utils/show_my_dialog.dart';
import 'package:nasa_api_app/utils/set_datepicker_date.dart';
import 'package:nasa_api_app/widgets/custom_dropdown.dart';
import 'dart:io' show Platform;

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

  void _showDialog(Widget child) {
    print('showCupertinoModal');
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        // The Bottom margin is provided to align the popup above the system
        // navigation bar.
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        // Provide a background color for the popup.
        color: CupertinoColors.systemBackground.resolveFrom(context),
        // Use a SafeArea widget to avoid system overlaps.
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    if (Platform.isIOS) {
      print('showIOS datepicker');
      _showDialog(
        CupertinoDatePicker(
          initialDateTime: setDate(missionEndDates, roverSelectedValue),
          maximumDate: setDate(missionEndDates, roverSelectedValue),
          minimumDate: setDate(missionStartdates, roverSelectedValue),
          mode: CupertinoDatePickerMode.date,
          use24hFormat: true,
          // This shows day of week alongside day of month
          showDayOfWeek: true,
          // This is called when the user changes the date.
          onDateTimeChanged: (DateTime newDate) {
            setState(() => selectedDate = newDate);
          },
        ),
      );
    } else {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: setDate(missionEndDates, roverSelectedValue),
        firstDate: setDate(missionStartdates, roverSelectedValue),
        lastDate: setDate(missionEndDates, roverSelectedValue),
      );

      if (picked != null && picked != selectedDate) {
        setState(() {
          selectedDate = picked;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> titleAndDescription = [
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
    ];
    final CustomDropdown roverDropdown = CustomDropdown(
      items: rovers
          .map<DropdownMenuItem<String>>(
              (rover) => DropdownMenuItem(value: rover, child: Text(rover)))
          .toList(),
      value: roverSelectedValue,
      onChanged: (String? value) {
        setState(() {
          roverSelectedValue = value;
          selectedDate = setDate(missionEndDates, roverSelectedValue);
        });
      },
      descriptionText: "Select Mars Rover",
    );

    final CustomDropdown cameraDropdown = CustomDropdown(
      items: getCameras(roverSelectedValue),
      value: cameraSelectedValue,
      onChanged: (String? value) {
        setState(() => cameraSelectedValue = value!);
      },
      descriptionText: "Select rover camera",
    );

    final Text selectedDateText = Text(
        'Selected date: ${selectedDate.toLocal().toString().split(' ')[0]}',
        style: Theme.of(context).textTheme.titleLarge);

    final List<Widget> dateButtons = [
      TextButton(
        onPressed: () {
          if (roverSelectedValue == null) {
            showMyDialog(context, "Select Rover first");
          } else {
            _selectDate(context);
          }
        },
        child: const Text('Select date'),
      ),
      const SizedBox(width: 20),
      TextButton(
        onPressed: () {
          if (roverSelectedValue == null) {
            showMyDialog(context, "Select Rover first");
          } else {
            DateTime? date = randomDateGenerator(roverSelectedValue!);
            if (date != null) {
              setState(() => selectedDate = date);
            }
          }
        },
        child: const Text("Random date"),
      ),
    ];

    final ElevatedButton showPhotosButton = ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          final String requestYear = selectedDate.year.toString();
          final String requestMonth = selectedDate.month.toString();
          final String requestDay = selectedDate.day.toString();
          final String formattedDate = '$requestYear-$requestMonth-$requestDay';
          context.read<MarsRoverCubit>().getRoverPhoto(
              roverSelectedValue!, formattedDate, cameraSelectedValue);
          context.goNamed('mrp-photos', pathParameters: {
            'date': formattedDate,
            'rover': roverSelectedValue!,
            'cameras': cameras
                .where((element) => element.value == cameraSelectedValue)
                .first
                .name
          });
        }
      },
      child: const Text('Show Photos'),
    );

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
          child: MediaQuery.of(context).orientation == Orientation.portrait
              ?

              // portrait layout

              Column(children: [
                  ...titleAndDescription,
                  roverDropdown,
                  cameraDropdown,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      selectedDateText,
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: dateButtons,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: showPhotosButton,
                  ),
                ])

              // Landscape layout
              : Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(children: titleAndDescription),
                    ),
                    Expanded(
                      flex: 3,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            roverDropdown,
                            cameraDropdown,
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                selectedDateText,
                                const SizedBox(
                                  height: 16.0,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    ...dateButtons,
                                    showPhotosButton,
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
