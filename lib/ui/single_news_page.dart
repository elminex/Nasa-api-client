import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_api_app/bloc/news/cubit/news_cubit.dart';
import 'package:nasa_api_app/utils/url_launch.dart';
import 'package:nasa_api_app/widgets/page_title.dart';
import 'package:transparent_image/transparent_image.dart';

class SingleNewsPage extends StatelessWidget {
  const SingleNewsPage({super.key, required this.articleId});
  final String articleId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(builder: (context, state) {
      if (state is NewsLoaded) {
        final article = state.paginatedNews.results
            .where((element) => element.id == int.parse(articleId))
            .first;
        return Scaffold(
          appBar: AppBar(title: const Text("Space news")),
          floatingActionButton: FloatingActionButton.extended(
              onPressed: () => openLink(article.url),
              label: const Text("Open in browser")),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PageTitle(
                    utf8.decode(article.title.codeUnits),
                  ),
                  FadeInImage(
                    image: NetworkImage(article.image_url),
                    height: 300,
                    fit: BoxFit.contain,
                    placeholder: MemoryImage(kTransparentImage),
                  ),
                  Text(utf8.decode(article.summary.codeUnits),
                      style: Theme.of(context).textTheme.bodySmall),
                  const SizedBox(height: 30),
                  RichText(
                    text: TextSpan(text: "From: ", children: [
                      TextSpan(
                          text: article.news_site,
                          style: Theme.of(context).textTheme.bodyMedium)
                    ]),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        );
      }
      if (state is NewsError) {
        return ErrorWidget(state.error);
      }
      return const Center(child: CircularProgressIndicator.adaptive());
    });
  }
}
