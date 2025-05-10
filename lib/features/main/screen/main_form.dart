import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivia_test_task/core/localization/localization.dart';

import '../cubit/main_cubit.dart';

class MainForm extends StatelessWidget {
  const MainForm({super.key});

  @override
  Widget build(BuildContext context) {
    final MainState state = context.watch<MainCubit>().state;

    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.categories.tr()),
        forceMaterialTransparency: true,
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: state.categories.length,
          itemBuilder: (context, index) {
            final category = state.categories[index];
            return ListTile(
              title: Text(category.name),
              onTap: () {
                context.read<MainCubit>().onCategorySelected(category);
              },
            );
          },
        ),
      ),
    );
  }
}
