import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PageBuilder extends StatelessWidget {
  final Widget page;
  final Widget? button;
  final List<Widget>? footerButtons;
  const PageBuilder(
      {super.key, required this.page, this.button, this.footerButtons});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NASA API CLIENT"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              child: Text("NASA API CLIENT"),
            ),
            ListTile(
              title: const Text("Astronomy picture of the day"),
              onTap: () => context.go('/'),
            ),
            ListTile(
              title: const Text('Earth Polychromatic Imaging Camera'),
              onTap: () => context.go('/epic'),
            ),
            ListTile(
              title: const Text('Mars rover Photos'),
              onTap: () => context.go('/mrp'),
            ),
            ListTile(
              title: const Text('Nasa Image Library'),
              onTap: () => context.go('/nil'),
            ),
            ListTile(
                title: const Text("Visible Planets"),
                onTap: () => context.go('/planets'))
          ],
        ),
      ),
      body: page,
      floatingActionButton: button,
      bottomNavigationBar: footerButtons != null
          ? SizedBox(
              height: 120,
              child: Container(
                decoration: const BoxDecoration(color: Colors.black),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: footerButtons!,
                ),
              ),
            )
          : null,
    );
  }
}
