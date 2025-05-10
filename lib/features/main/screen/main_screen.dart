import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivia_test_task/core/di/app_di.dart';
import 'package:trivia_test_task/core/service/toast_service.dart';
import 'package:trivia_test_task/domain/use_cases/get_quiz_categories_use_case.dart';
import 'package:trivia_test_task/navigation/app_router.dart';

import '../cubit/main_cubit.dart';
import 'main_form.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCubit(
        appRouter: appLocator<AppRouter>(),
        getQuizCategoriesUseCase: appLocator<GetQuizCategoriesUseCase>(),
        toastService: appLocator<ToastService>(),
      )..init(),
      child: const MainForm(),
    );
  }
}
