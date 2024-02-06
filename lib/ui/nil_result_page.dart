import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_api_app/api/models/nil/nil_link.dart';
import 'package:nasa_api_app/bloc/nil/cubit/nil_cubit.dart';
import 'package:nasa_api_app/widgets/NIL_result_grid_item.dart';
import 'package:nasa_api_app/widgets/pagination_arrows.dart';

class NILResultPage extends StatelessWidget {
  const NILResultPage({super.key});

  void _onPressed(String direction, BuildContext context, List<NILLink> links) {
    context.read<NILCubit>().getCollections(
        null, links.where((element) => element.rel == direction).first.href);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nasa Image Library Results"),
      ),
      backgroundColor: Colors.black,
      body: BlocBuilder<NILCubit, NILState>(builder: (context, state) {
        if (state is NILLoaded) {
          return Column(
            children: [
              Expanded(
                child: GridView(
                  padding: const EdgeInsets.all(24),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                        ? 2
                        : 4,
                    childAspectRatio: 4 / 3,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  children: state.collection.items
                      .map((item) => NILResultGridItem(item: item))
                      .toList(),
                ),
              ),
              PaginationArrows(
                onPressedNext: state.collection.links
                        .where((element) => element.rel == 'next')
                        .isEmpty
                    ? null
                    : () => _onPressed('next', context, state.collection.links),
                onPressedPrev: state.collection.links
                        .where((element) => element.rel == 'prev')
                        .isEmpty
                    ? null
                    : () => _onPressed('prev', context, state.collection.links),
              ),
            ],
          );
        }
        if (state is NILError) {
          return ErrorWidget(state.error);
        }
        return const Center(child: CircularProgressIndicator.adaptive());
      }),
    );
  }
}
