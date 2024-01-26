import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nasa_api_app/widgets/indicator_dots.dart';
import 'package:nasa_api_app/widgets/pagination_arrows.dart';

const itemsPerPage = 20;

class MrpResultLoaded extends StatefulWidget {
  const MrpResultLoaded(
      {super.key,
      required this.images,
      required this.date,
      required this.rover,
      required this.cameras});

  final String date;
  final String rover;
  final String cameras;
  final List<Image> images;

  @override
  MrpResultLoadedState createState() => MrpResultLoadedState();
}

class MrpResultLoadedState extends State<MrpResultLoaded> {
  int _currentSlide = 0;
  final CarouselController _controller = CarouselController();
  int currentPage = 0;
  bool autoplay = true;
  @override
  Widget build(BuildContext context) {
    final List<Image> images = widget.images;

    int nextPageRangeStart = currentPage * itemsPerPage;
    int nextPageRangeEnd = (currentPage + 1) * itemsPerPage;
    final List<Image> imagesRange = images
        .getRange(nextPageRangeStart,
            nextPageRangeEnd > images.length ? images.length : nextPageRangeEnd)
        .toList();

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: const AssetImage('lib/images/mars_With_rover.jpeg'),
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.8),
            BlendMode.srcOver,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12),
                child: Text(
                  "Images from Mars",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Rover: ${widget.rover}',
                        textAlign: TextAlign.start,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          'Cameras: ${widget.cameras}',
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Text(
                        'Date: ${widget.date}',
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Image.asset('lib/images/curiosity.jpeg'),
                )
              ],
            ),
            const SizedBox(height: 16),
            CarouselSlider(
              items: imagesRange,
              carouselController: _controller,
              options: CarouselOptions(
                  autoPlay: autoplay,
                  enlargeCenterPage: true,
                  aspectRatio: 4 / 3,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentSlide = index;
                    });
                  }),
            ),
            const SizedBox(height: 12),
            Center(
              child: IndicatorDots(
                  controller: _controller,
                  current: _currentSlide,
                  images: imagesRange),
            ),
            const SizedBox(height: 30),
            Center(
              child: Text(
                  'Showing images $nextPageRangeStart to ${nextPageRangeEnd > images.length ? images.length : nextPageRangeEnd} out of ${images.length}.'),
            ),
            PaginationArrows(
              onPressedNext: nextPageRangeEnd >= images.length
                  ? null
                  : () {
                      int nextPage = currentPage + 1;
                      setState(() => currentPage = nextPage);
                    },
              onPressedPrev: currentPage - 1 < 0
                  ? null
                  : () {
                      int prevPage = currentPage - 1;
                      setState(() => currentPage = prevPage);
                    },
            )
          ],
        ),
      ),
    );
  }
}
