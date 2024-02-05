import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_api_app/api/models/visible_planets/data.dart';
import 'package:nasa_api_app/bloc/visible_planets/cubit/visible_planets_cubit.dart';
import 'package:nasa_api_app/dummy_planet_data.dart';
import 'package:nasa_api_app/widgets/plantet_thumbnail.dart';

class VisiblePlanetsPage extends StatefulWidget {
  const VisiblePlanetsPage({super.key});

  @override
  State<VisiblePlanetsPage> createState() => _VisiblePlanetsPageState();
}

class _VisiblePlanetsPageState extends State<VisiblePlanetsPage> {
  String selectedPlanet = 'earth';
  bool startAnimation = false;

  void tapHandler(String planetName) {
    setState(() {
      startAnimation = true;
      Future.delayed(Durations.short4, () => selectedPlanet = planetName);
    });
  }

  String checkVisibility(List<Data> listOfPlanets) {
    Data currentPlanet =
        listOfPlanets.where((planet) => planet.name == selectedPlanet).first;
    if (currentPlanet.nakedEyeObject == true) {
      return "${currentPlanet.name} has a magnitude of ${currentPlanet.magnitude} and is visible with naked eye from your position";
    }
    return "${currentPlanet.name} has a magnitude of ${currentPlanet.magnitude} and is not visible with naked eye from your position";
  }

  @override
  Widget build(BuildContext context) {
    print(selectedPlanet);
    return BlocBuilder<VisiblePlanetsCubit, VisiblePlanetsState>(
        builder: (context, state) {
      if (state is VisiblePlanetsLoaded) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 32.0),
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    PlanetThumbnail(
                        planet: 'earth',
                        selected: selectedPlanet == 'earth',
                        tapHandler: tapHandler),
                    ...state.listOfPlanets.map((planet) => PlanetThumbnail(
                        planet: planet.name,
                        selected: selectedPlanet == planet.name,
                        tapHandler: tapHandler))
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                  child: AnimatedScale(
                    duration: Durations.short4,
                    scale: startAnimation ? 0 : 1,
                    onEnd: () => setState(() => startAnimation = false),
                    child: Column(
                      children: [
                        Image.asset(
                          'lib/images/${selectedPlanet.toLowerCase()}Large.jpeg',
                        ),
                        const SizedBox(height: 20),
                        Text(planetDescriptions[
                            '${selectedPlanet.toLowerCase()}Description']!),
                        const SizedBox(height: 12),
                        if (selectedPlanet != 'earth')
                          Text(checkVisibility(state.listOfPlanets))
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      }
      if (state is VisiblePlanetsError) {
        return ErrorWidget(state.error);
      } else {
        return const CircularProgressIndicator.adaptive();
      }
    });
  }
}
