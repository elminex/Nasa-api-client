import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_api_app/widgets/epic_element.dart';
import 'package:collection/collection.dart';
import 'package:nasa_api_app/widgets/pagination_arrows.dart';
import '../bloc/epic/cubit/epic_cubit.dart';

class EpicPage extends StatefulWidget {
  const EpicPage({super.key});

  @override
  State<EpicPage> createState() => _EpicPageState();
}

class _EpicPageState extends State<EpicPage> {
  final _controller = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EpicCubit, EpicState>(
      builder: (context, state) {
        if (state is EpicLoaded) {
          return Column(
            children: [
              Expanded(
                child: PageView(
                  controller: _controller,
                  onPageChanged: (value) =>
                      setState(() => _currentPage = value),
                  children: state.epic
                      .mapIndexed((index, epic) => EpicElement(
                          epic: epic, index: index, controller: _controller))
                      .toList(),
                ),
              ),
              Text('Showing image ${_currentPage + 1} of ${state.epic.length}'),
              PaginationArrows(
                onPressedNext: () => _controller.nextPage(
                  duration: Durations.medium1,
                  curve: Curves.easeIn,
                ),
                onPressedPrev: () => _controller.previousPage(
                  duration: Durations.medium1,
                  curve: Curves.easeIn,
                ),
              )
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
