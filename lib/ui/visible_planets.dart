import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_api_app/bloc/visible_planets/cubit/visible_planets_cubit.dart';

class VisiblePlanetsPage extends StatelessWidget {
  const VisiblePlanetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VisiblePlanetsCubit, VisiblePlanetsState>(
        builder: (context, state) {
      if (state is VisiblePlanetsLoaded) {
        return Column(children: [
          const Text("Solar system objects visible from your location"),
          Table(
            border: TableBorder.all(),
            children: [
              const TableRow(children: [Text("name"), Text("visibility")]),
              ...state.listOfPlanets.map(
                (planet) => TableRow(
                  children: [
                    Text(planet.name),
                    Text(
                      !planet.nakedEyeObject
                          ? 'Not visible with naked eyes'
                          : 'Visible with naked eyes',
                    ),
                  ],
                ),
              ),
            ],
          )
        ]);
      }
      if (state is VisiblePlanetsError) {
        return ErrorWidget(state.error);
      } else {
        return const CircularProgressIndicator.adaptive();
      }
    });
  }
}
