import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nasa_api_app/bloc/nil/cubit/nil_cubit.dart';

class NILFormPage extends StatefulWidget {
  const NILFormPage({super.key});

  @override
  State<NILFormPage> createState() => _NILFormPageState();
}

class _NILFormPageState extends State<NILFormPage> {
  final _queryTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _queryTextController,
        ),
        TextButton(
            onPressed: () {
              context
                  .read<NILCubit>()
                  .getCollections(_queryTextController.text);
              context.go('/nil/result');
            },
            child: const Text("Search for image"))
      ],
    );
  }
}
