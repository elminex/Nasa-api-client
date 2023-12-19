import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/apod/apod_cubit.dart';
import '../bloc/apod/apod_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApodCubit, ApodState>(
      builder: (context, state) {
        if (state is ApodLoaded) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  if (state.apod.title != null) Text(state.apod.title!),
                  if (state.apod.date != null)
                    Text(
                        'Release date: ${state.apod.date!.year}-${state.apod.date!.month}-${state.apod.date!.day}'),
                  state.apod.url != null
                      ? Image(
                          image: NetworkImage(state.apod.url!),
                          height: 300,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            }
                            return const Center(
                                child: SizedBox(
                                    height: 300,
                                    child:
                                        CircularProgressIndicator.adaptive()));
                          },
                        )
                      : const Image(
                          image: AssetImage('lib/images/apoc_placeholder.jpeg'),
                          fit: BoxFit.cover,
                        ),
                  if (state.apod.explanation != null)
                    Text(state.apod.explanation!),
                  if (state.apod.copyright != null)
                    Text('copyright: ${state.apod.copyright}'),
                ],
              ),
            ),
          );
        }
        if (state is ApodError) {
          return ErrorWidget(state.error);
        }
        return const Center(child: CircularProgressIndicator.adaptive());
      },
    );
  }
}
