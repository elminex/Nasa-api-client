import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_api_app/bloc/mars_rover/cubit/mars_rover_cubit.dart';
import 'package:nasa_api_app/widgets/mrp_result_loaded.dart';

class MarsRoverPhotoPage extends StatefulWidget {
  const MarsRoverPhotoPage(
      {super.key,
      required this.date,
      required this.rover,
      required this.cameras});

  final String date;
  final String rover;
  final String cameras;

  @override
  State<MarsRoverPhotoPage> createState() => _MarsRoverPhotoPageState();
}

class _MarsRoverPhotoPageState extends State<MarsRoverPhotoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mars Rover Photos"),
      ),
      body: BlocBuilder<MarsRoverCubit, MarsRoverState>(
        builder: (context, state) {
          if (state is MarsRoverLoaded) {
            final List<Image> images = state.photos
                .map((image) => Image(
                      image: NetworkImage(image.img_src),
                    ))
                .toList();

            return MrpResultLoaded(
              images: images,
              cameras: widget.cameras,
              date: widget.date,
              rover: widget.rover,
            );
          }
          if (state is MarsRoverError) {
            return ErrorWidget(state.error);
          }
          if (state is MarsRoverLoadedNoImages) {
            return Center(
              child: Text(
                "No images, try different settings",
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color: Theme.of(context).colorScheme.error,
                    ),
                textAlign: TextAlign.center,
              ),
            );
          }
          return const Center(child: CircularProgressIndicator.adaptive());
        },
      ),
    );
  }
}
