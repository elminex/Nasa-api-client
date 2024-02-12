import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DrawerTile extends StatelessWidget {
  const DrawerTile(this.description, this.route, {super.key, this.icon});

  final String description;
  final String route;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Theme.of(context).colorScheme.onPrimary),
      title: Text(
        description,
        style: Theme.of(context).textTheme.bodySmall,
      ),
      onTap: () => context.go(route),
    );
  }
}
