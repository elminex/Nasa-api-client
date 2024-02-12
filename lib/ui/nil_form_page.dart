import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nasa_api_app/bloc/nil/cubit/nil_cubit.dart';
import 'package:nasa_api_app/utils/show_my_dialog.dart';
import 'package:nasa_api_app/widgets/page_title.dart';

class NILFormPage extends StatefulWidget {
  const NILFormPage({super.key});

  @override
  State<NILFormPage> createState() => _NILFormPageState();
}

class _NILFormPageState extends State<NILFormPage> {
  final _queryTextController = TextEditingController();

  @override
  void dispose() {
    _queryTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 24.0),
              child: PageTitle(
                'NASA Image and Video Library',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Text(
                  'NASA Image and Video Library, serving up consolidated imagery and videos in one searchable location. Users can download content in multiple sizes and resolutions and see the metadata associated with images, including EXIF/camera data on many images.',
                  style: Theme.of(context).textTheme.bodySmall),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: TextField(
                controller: _queryTextController,
                decoration: InputDecoration(
                  label: const Text("Search for images"),
                  contentPadding: const EdgeInsets.symmetric(vertical: 12),
                  hintText: "What do you want to search for?",
                  labelStyle: Theme.of(context).textTheme.bodySmall,
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.onPrimary,
                        width: 1),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.onPrimary,
                        width: 3),
                  ),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  if (_queryTextController.text.isNotEmpty) {
                    context
                        .read<NILCubit>()
                        .getCollections(_queryTextController.text, null);
                    context.go('/nil/result');
                  } else {
                    showMyDialog(context, "Input can't be empty");
                  }
                },
                child: const Text("Search for image"))
          ],
        ),
      ),
    );
  }
}
