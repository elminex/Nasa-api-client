import 'package:flutter/material.dart';

void showMyDialog(BuildContext context, String text) {
  showAdaptiveDialog(
    context: context,
    builder: (ctx) => AlertDialog.adaptive(
      content: Text(text),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(ctx).pop();
          },
          child: const Text(
            "Go back",
          ),
        ),
      ],
    ),
  );
}
