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
          final Widget titleAndImage = Expanded(
            child: PageView(
              controller: _controller,
              onPageChanged: (value) => setState(() => _currentPage = value),
              children: state.epic
                  .mapIndexed((index, epic) => EpicElement(
                      epic: epic, index: index, controller: _controller))
                  .toList(),
            ),
          );

          final Widget pagination = PaginationArrows(
              onPressedNext: _currentPage == state.epic.length - 1
                  ? null
                  : () => _controller.nextPage(
                        duration: Durations.medium1,
                        curve: Curves.easeIn,
                      ),
              onPressedPrev: _currentPage == 0
                  ? null
                  : () => _controller.previousPage(
                        duration: Durations.medium1,
                        curve: Curves.easeIn,
                      ),
              text:
                  'Showing image ${_currentPage + 1} of ${state.epic.length}');
          final List<Widget> imageTypeButtons = ImageTypeEnum.values
              .map(
                (type) => Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: TextButton(
                      onPressed: () {
                        context.read<EpicCubit>().getImages(type.name);
                        setState(() => _currentPage = 0);
                      },
                      child: Text(
                        type.name,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ),
                ),
              )
              .toList();
          return MediaQuery.of(context).orientation == Orientation.portrait
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    titleAndImage,
                    pagination,
                    Text(
                      'Select image type:',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 24.0),
                      child: Row(
                        children: imageTypeButtons,
                      ),
                    )
                  ],
                )
              : Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [titleAndImage, pagination],
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          'Select image type:',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        ...imageTypeButtons
                      ],
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
