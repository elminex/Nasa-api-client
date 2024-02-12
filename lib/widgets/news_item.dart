import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:nasa_api_app/api/models/news/article.dart';
import 'package:transparent_image/transparent_image.dart';

final format = DateFormat.yMd();

class NewsItem extends StatelessWidget {
  const NewsItem({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8),
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          image: DecorationImage(
            image: FadeInImage.memoryNetwork(
              image: article.image_url,
              height: 300,
              fit: BoxFit.contain,
              placeholder: kTransparentImage,
            ).image,
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.7),
              BlendMode.srcOver,
            ),
          ),
        ),
        child: InkWell(
          onTap: () {
            context.goNamed('single-news',
                pathParameters: {"id": article.id.toString()});
          },
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(article.news_site),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24),
                child: Text(
                  utf8.decode(article.title.codeUnits),
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              Text(format.format(DateTime.parse(article.published_at))),
            ],
          ),
        ),
      ),
    );
  }
}
