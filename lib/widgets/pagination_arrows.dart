import 'package:flutter/material.dart';

class PaginationArrows extends StatelessWidget {
  const PaginationArrows(
      {super.key, required this.onPressedNext, required this.onPressedPrev});

  final void Function()? onPressedNext;
  final void Function()? onPressedPrev;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 8, 32, 32.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: onPressedPrev,
          ),
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            disabledColor: Colors.white12,
            onPressed: onPressedNext,
          )
        ],
      ),
    );
  }
}
