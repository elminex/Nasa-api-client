import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_api_app/api/models/epic/image_type_enum.dart';
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
              ),
              const Text('Select image type:'),
              Row(
                children: [
                  ...ImageTypeEnum.values.map((type) => Expanded(
                        flex: 1,
                        child: TextButton(
                          onPressed: () {
                            context.read<EpicCubit>().getImages(type.name);
                            setState(() => _currentPage = 0);
                          },
                          child: Text(
                            type.name,
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                          ),
                        ),
                      )),
                ],
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
