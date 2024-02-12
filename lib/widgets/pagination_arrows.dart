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
      padding: const EdgeInsets.fromLTRB(0, 8, 16, 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Theme.of(context).colorScheme.onSecondary,
            onPressed: onPressedPrev,
            disabledColor: Colors.white38,
          ),
          if (text != null)
            Text(text!, style: Theme.of(context).textTheme.bodySmall),
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            color: Theme.of(context).colorScheme.onSecondary,
            disabledColor: Colors.white38,
            onPressed: onPressedNext,
          )
        ],
      ),
    );
  }
}
