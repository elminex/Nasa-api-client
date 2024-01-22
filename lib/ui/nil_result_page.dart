import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_api_app/bloc/nil/cubit/nil_cubit.dart';
import 'package:nasa_api_app/bloc/nil_image/cubit/nil_image_cubit.dart';
import 'package:nasa_api_app/widgets/nil_image_modal.dart';

class NILResultPage extends StatelessWidget {
  const NILResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<NILCubit, NILState>(builder: (context, state) {
        if (state is NILLoaded) {
          return ListView(children: [
            ...state.collection.items.map((e) => TextButton(
                onPressed: () {
                  showModalBottomSheet(
                      useSafeArea: true,
                      context: context,
                      builder: (context) {
                        return const NILImageModal();
                      });
                  context.read<NilImageCubit>().getNILImage(e.href);
                },
                child: Text(e.data[0].title)))
          ]);
        }
        if (state is NILError) {
          return ErrorWidget(state.error);
        }
        return const Center(child: CircularProgressIndicator.adaptive());
      }),
    );
  }
}
