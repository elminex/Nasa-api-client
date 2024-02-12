import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_api_app/bloc/news/cubit/news_cubit.dart';
import 'package:nasa_api_app/widgets/infinite_scroll_pagination.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    return SafeArea(
      child: Column(children: [
        Expanded(
          child: InfiniteScrollPagination(
              scrollController: scrollController,
              fetchDataFunction: context.read<NewsCubit>().getNews),
        )
      ]),
    );
  }
}
