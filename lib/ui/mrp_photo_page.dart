import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_api_app/bloc/mars_rover/cubit/mars_rover_cubit.dart';

import '../widgets/indicator_dots.dart';

class MarsRoverPhotoPage extends StatefulWidget {
  const MarsRoverPhotoPage({super.key});

  @override
  State<MarsRoverPhotoPage> createState() => _MarsRoverPhotoPageState();
}

class _MarsRoverPhotoPageState extends State<MarsRoverPhotoPage> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<MarsRoverCubit, MarsRoverState>(
        builder: (context, state) {
          if (state is MarsRoverLoaded) {
            final List<Image> images = state.photos
                .map((image) => Image(
                      image: NetworkImage(image.img_src),
                    ))
                .toList();
            if (images.isEmpty) {
              const Center(
                child: Text("No images, try different settings"),
              );
            }
            return Column(
              children: [
                CarouselSlider(
                  items: getImageSliders(images),
                  carouselController: _controller,
                  options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      aspectRatio: 1.0,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      }),
                ),
                const SizedBox(height: 10),
                IndicatorDots(
                    controller: _controller, current: _current, images: images),
                const SizedBox(height: 30),
              ],
            );
          }
          if (state is MarsRoverError) {
            return ErrorWidget(state.error);
          }
          return const Center(child: CircularProgressIndicator.adaptive());
        },
      ),
    );
  }
}

List<Widget> getImageSliders(List<Image> images) {
  return images
      .map(
        (item) => Container(
          margin: const EdgeInsets.all(5.0),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            child: Stack(
              children: <Widget>[
                item,
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(200, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 30.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      )
      .toList();
}
