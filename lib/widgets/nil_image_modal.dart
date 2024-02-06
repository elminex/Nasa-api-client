import 'dart:convert';
import 'package:transparent_image/transparent_image.dart';

import 'package:flutter/material.dart';
import 'package:nasa_api_app/utils/html_parse.dart';

class NILImageModal extends StatelessWidget {
  const NILImageModal(
      {super.key, required this.imageLinks, required this.imageDescription});

  final List<String> imageLinks;
  final String imageDescription;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: HtmlToRichTextWidget(
                    htmlString: utf8.decode(imageDescription.codeUnits),
                  )),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 32, 12, 64),
                child: FadeInImage(
                  placeholder: MemoryImage(kTransparentImage),
                  image: NetworkImage(imageLinks[0]),
                  fit: BoxFit.cover,
                  width: double.infinity,
                  // height: double.infinity,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
