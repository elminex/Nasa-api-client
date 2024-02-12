import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_api_app/api/models/news/article.dart';
import 'package:nasa_api_app/bloc/news/cubit/news_cubit.dart';
import 'package:nasa_api_app/widgets/news_item.dart';

typedef FetchDataFunction = void Function(
    int currentPage, int pageSize, String? paginationUrl);

class InfiniteScrollPagination extends StatefulWidget {
  final ScrollController scrollController;
  final FetchDataFunction fetchDataFunction;
  const InfiniteScrollPagination(
      {super.key,
      required this.scrollController,
      required this.fetchDataFunction});

  @override
  State<InfiniteScrollPagination> createState() =>
      _InfiniteScrollPaginationState();
}

class _InfiniteScrollPaginationState extends State<InfiniteScrollPagination> {
  final List<Article> _currentItems = [];
  int _currentPage = 1;
  final int _pageSize = 30;
  late final ScrollController _scrollController;
  bool _isFetchingData = false;
  String? _nextPage;

  Future<void> _fetchPaginatedData() async {
    if (_isFetchingData) {
      // Avoid fetching new data while already fetching
      return;
    }
    try {
      _isFetchingData = true;
      setState(() {});

      final startTime = DateTime.now();
      context.read<NewsCubit>().getNews(_currentPage, _pageSize, _nextPage);
      // Add the updated list to the stream without overwriting the previous data
      final endTime = DateTime.now();
      final timeDifference =
          endTime.millisecondsSinceEpoch - startTime.millisecondsSinceEpoch;

      if (timeDifference < 2000) {
        // Delay for 2 seconds if the time taken by the API request is less then 2 seconds
        await Future.delayed(const Duration(milliseconds: 2000));
      }
      _currentPage++;
    } finally {
      // Set to false when data fetching is complete
      _isFetchingData = false;
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController = widget.scrollController;
    _fetchPaginatedData();
    _scrollController.addListener(() {
      _scrollController.addListener(() {
        final maxScroll = _scrollController.position.maxScrollExtent;
        final currentScroll = _scrollController.position.pixels;

        if (currentScroll == maxScroll) {
          // When the last item is fully visible, load the next page.
          _fetchPaginatedData();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        if (state is NewsLoaded) {
          // Display the paginated data
          final items = state.paginatedNews.results;
          _currentItems.addAll(items);
          _nextPage = state.paginatedNews.next;
          return ListView(
            controller: _scrollController,
            children: [
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return NewsItem(article: items[index]);
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                ),
              ),
              if (_isFetchingData)
                const Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 32.0),
                    child: CircularProgressIndicator(),
                  ),
                ),
            ],
          );
        }
        if (state is NewsError) {
          return ErrorWidget(state.error);
        }
        return const Center(child: CircularProgressIndicator.adaptive());
      },
    );
  }
}
