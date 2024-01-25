import 'package:flutter/material.dart';
import 'package:nasa_api_app/api/models/nil/filtered_nil_item.dart';
import 'package:nasa_api_app/widgets/nil_image_modal.dart';

class NILResultGridItem extends StatelessWidget {
  const NILResultGridItem({super.key, required this.item});

  final FilteredNILItem item;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          item.imageLinks[1],
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Container(
          decoration: const BoxDecoration(
            color: Color.fromRGBO(0, 0, 0, 0.742),
            backgroundBlendMode: BlendMode.multiply,
          ),
          child: Center(
            child: TextButton(
              onPressed: () {
                showModalBottomSheet(
                    useSafeArea: true,
                    isScrollControlled: true,
                    context: context,
                    builder: (BuildContext ctx) {
                      return NILImageModal(
                          imageLinks: item.imageLinks,
                          imageDescription: item.description);
                    });
              },
              child: Text(
                item.title,
                textAlign: TextAlign.center,
                softWrap: true,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
