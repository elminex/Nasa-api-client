import 'package:flutter/material.dart';

class PlanetThumbnail extends StatelessWidget {
  const PlanetThumbnail(
      {super.key,
      required this.planet,
      required this.selected,
      required this.tapHandler});

  final void Function(String planet) tapHandler;
  final String planet;
  final bool selected;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 4.0),
      child: AnimatedContainer(
        duration: Durations.medium1,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
            color: selected ? Colors.grey : Colors.transparent,
            borderRadius: BorderRadius.circular(12)),
        child: InkWell(
          onTap: () {
            tapHandler(planet);
          },
          child: Column(
            children: [
              Image.asset(
                'lib/images/${planet.toLowerCase()}.png',
                height: 80,
                width: 80,
                fit: BoxFit.contain,
              ),
              AnimatedDefaultTextStyle(
                  duration: Durations.medium1,
                  style:
                      TextStyle(color: selected ? Colors.black : Colors.white),
                  child: Text(planet))
            ],
          ),
        ),
      ),
    );
  }
}
