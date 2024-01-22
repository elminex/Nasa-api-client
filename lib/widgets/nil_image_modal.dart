import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_api_app/bloc/nil_image/cubit/nil_image_cubit.dart';

class NILImageModal extends StatelessWidget {
  const NILImageModal({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: BlocBuilder<NilImageCubit, NILImageState>(
        builder: (context, state) {
          if (state is NILImageLoaded) {
            return Image.network(
              state.imageLink,
              fit: BoxFit.contain,
            );
          }
          if (state is NILImageError) {
            return ErrorWidget(state.error);
          }
          return const CircularProgressIndicator.adaptive();
        },
      ),
    );
  }
}
