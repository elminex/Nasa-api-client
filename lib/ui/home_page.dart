import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transparent_image/transparent_image.dart';
import '../bloc/apod/apod_cubit.dart';
import '../bloc/apod/apod_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApodCubit, ApodState>(
      builder: (context, state) {
        if (state is ApodLoaded) {
          final Widget image = state.apod.url != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: FadeInImage(
                    image: NetworkImage(state.apod.url!),
                    height: 300,
                    fit: BoxFit.contain,
                    placeholder: MemoryImage(kTransparentImage),
                  ),
                )
              : const Padding(
                  padding: EdgeInsets.symmetric(vertical: 24),
                  child: Image(
                    image: AssetImage('lib/images/apoc_placeholder.jpeg'),
                    fit: BoxFit.cover,
                  ),
                );

          return Padding(
            padding: MediaQuery.of(context).orientation == Orientation.landscape
                ? const EdgeInsets.all(12)
                : const EdgeInsets.fromLTRB(12.0, 12, 12, 110),
            child: MediaQuery.of(context).orientation == Orientation.landscape
                ? Row(
                    children: [
                      Expanded(
                        child: image,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(children: [
                            if (state.apod.title != null)
                              Text(
                                state.apod.title!,
                                style:
                                    Theme.of(context).textTheme.headlineLarge,
                                textAlign: TextAlign.center,
                              ),
                            if (state.apod.date != null)
                              Text(
                                'Release date: ${state.apod.date!.year}-${state.apod.date!.month}-${state.apod.date!.day}',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            if (state.apod.explanation != null)
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(state.apod.explanation!),
                              ),
                            if (state.apod.copyright != null)
                              Text('copyright: ${state.apod.copyright}'),
                          ]),
                        ),
                      ),
                    ],
                  )
                : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Column(
                        children: [
                          if (state.apod.title != null)
                            Text(
                              state.apod.title!,
                              style: Theme.of(context).textTheme.headlineLarge,
                              textAlign: TextAlign.center,
                            ),
                          if (state.apod.date != null)
                            Text(
                              'Release date: ${state.apod.date!.year}-${state.apod.date!.month}-${state.apod.date!.day}',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          image,
                          if (state.apod.explanation != null)
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(state.apod.explanation!),
                            ),
                          if (state.apod.copyright != null)
                            Text('copyright: ${state.apod.copyright}'),
                        ],
                      ),
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
