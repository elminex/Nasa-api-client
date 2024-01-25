import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_api_app/api/models/epic/epic.dart';

import '../bloc/epic/cubit/epic_cubit.dart';

class EpicPage extends StatelessWidget {
  const EpicPage({super.key});

  List<Widget> getImageList(BuildContext context, List<Epic> epics) {
    return epics
        .map(
          (e) => Image(
            image: NetworkImage(e.image),
            fit: BoxFit.fitWidth,
            width: MediaQuery.of(context).size.width,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return const Center(
                  child: SizedBox(child: CircularProgressIndicator.adaptive()));
            },
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EpicCubit, EpicState>(
      builder: (context, state) {
        if (state is EpicLoaded) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text("Latest EPIC pictures of earth."),
              Expanded(
                child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: getImageList(context, state.epic)),
              ),
            ],
          );
        }
        if (state is EpicError) {
          return ErrorWidget(state.error);
        }
        return const Center(child: CircularProgressIndicator.adaptive());
      },
    );
  }
}
