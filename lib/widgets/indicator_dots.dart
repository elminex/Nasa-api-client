import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';

class IndicatorDots extends StatelessWidget {
  const IndicatorDots({
    super.key,
    required CarouselController controller,
    required int current,
    required this.images,
  })  : _controller = controller,
        _current = current;

  final CarouselController _controller;
  final int _current;
  final List<Image> images;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: images.asMap().entries.map((entry) {
        return GestureDetector(
          onTap: () => _controller.animateToPage(entry.key),
          child: Container(
            width: 8.0,
            height: 8.0,
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 1),
                color: Colors.white
                    .withOpacity(_current == entry.key ? 0.9 : 0.2)),
          ),
        );
      }).toList(),
    );
  }
}
