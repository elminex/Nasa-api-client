import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  const CustomDropdown({
    super.key,
    required this.items,
    required this.value,
    required this.onChanged,
    required this.descriptionText,
  });
  final List<DropdownMenuItem<String>>? items;
  final String? value;
  final void Function(String?) onChanged;
  final String descriptionText;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      isExpanded: true,
      padding: const EdgeInsets.only(bottom: 16),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 0,
        ),
        labelText: descriptionText,
      ),
      hint: Text(descriptionText),
      validator: (value) => value == null ? descriptionText : null,
      value: value,
      items: items,
      onChanged: onChanged,
    );
  }
}
