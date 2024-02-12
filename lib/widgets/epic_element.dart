import 'package:flutter/material.dart';
import 'package:nasa_api_app/api/models/epic/epic.dart';
import 'package:nasa_api_app/widgets/page_title.dart';

class EpicElement extends StatelessWidget {
  const EpicElement(
      {super.key,
      required this.epic,
      required this.index,
      required this.controller});

  final Epic epic;
  final int index;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    final Widget image = Expanded(
      child: Image(
        image: NetworkImage(epic.image),
        fit: BoxFit.contain,
        width: MediaQuery.of(context).size.width,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return const Center(
              child: SizedBox(child: CircularProgressIndicator.adaptive()));
        },
      ),
    );

    return MediaQuery.of(context).orientation == Orientation.portrait
        ? Padding(
            padding: const EdgeInsets.fromLTRB(16, 24.0, 16, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const PageTitle(
                  "Latest EPIC pictures of earth.",
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.fromLTRB(12.0, 0, 12, 12),
                  child: Text('${epic.caption} on ${epic.date}',
                      style: Theme.of(context).textTheme.bodySmall),
                ),
                image,
              ],
            ),
          )
        : Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const PageTitle(
                      "Latest EPIC pictures of earth.",
                    ),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12.0, 0, 12, 12),
                      child: Text('${epic.caption} on ${epic.date}'),
                    ),
                  ],
                ),
              ),
              Expanded(child: image),
            ],
          );
  }
}
