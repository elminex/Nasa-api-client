import 'package:flutter/material.dart';

class PaginationArrows extends StatelessWidget {
  const PaginationArrows(
      {super.key,
      required this.onPressedNext,
      required this.onPressedPrev,
      this.text});

  final void Function()? onPressedNext;
  final void Function()? onPressedPrev;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 16, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: onPressedPrev,
          ),
          if (text != null) Text(text!),
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
