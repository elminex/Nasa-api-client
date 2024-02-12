import 'package:flutter/material.dart';
import 'package:nasa_api_app/widgets/drawer_tile.dart';

class PageBuilder extends StatelessWidget {
  final Widget page;
  final Widget? button;
  final List<Widget>? footerButtons;
  const PageBuilder(
      {super.key, required this.page, this.button, this.footerButtons});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation:
          MediaQuery.of(context).orientation == Orientation.portrait
              ? FloatingActionButtonLocation.centerDocked
              : FloatingActionButtonLocation.endFloat,
      appBar: AppBar(
        title: const Text("NASA API CLIENT"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Center(
                  child: Text(
                "Explorer",
                style: Theme.of(context).textTheme.displaySmall,
              )),
            ),
            const Divider(),
            const DrawerTile("Astronomy picture of the day", '/',
                icon: Icons.event),
            const DrawerTile('Earth Polychromatic Imaging Camera', '/epic',
                icon: Icons.travel_explore),
            const DrawerTile('Mars rover Photos', '/mrp',
                icon: Icons.photo_camera),
            const DrawerTile('Nasa Image Library', '/nil',
                icon: Icons.photo_library),
            const DrawerTile("Our solar system", '/planets', icon: Icons.book),
            const DrawerTile("Space news", '/news', icon: Icons.newspaper),
          ],
        ),
      ),
      body: page,
      floatingActionButton: button,
    );
  }
}
