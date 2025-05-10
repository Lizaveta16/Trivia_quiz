import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:trivia_test_task/core/constants/api_constants.dart';
import 'package:trivia_test_task/core/network/dio_config.dart';
import 'package:trivia_test_task/core/service/toast_service.dart';
import 'package:trivia_test_task/data/providers/api/quiz_api_provider.dart';
import 'package:trivia_test_task/data/providers/local/hive_provider.dart';
import 'package:trivia_test_task/data/providers/local/hive_provider_impl.dart';
import 'package:trivia_test_task/data/providers/local/quiz_hive_data_provider.dart';
import 'package:trivia_test_task/data/providers/quiz_provider.dart';
import 'package:trivia_test_task/data/providers/quiz_local_data_provider.dart';
import 'package:trivia_test_task/data/providers/shared_preferencies_provider.dart';
import 'package:trivia_test_task/data/repositories/quiz_repository_impl.dart';
import 'package:trivia_test_task/domain/domain.dart';
import 'package:trivia_test_task/navigation/app_router.dart';

final GetIt appLocator = GetIt.instance;

class AppDI {
  static Future<void> init() async {
    appLocator.registerSingleton<AppRouter>(AppRouter());

    appLocator.registerLazySingleton<DioConfig>(
      () {
        return DioConfig(
          baseUrl: ApiConstants.baseUrl,
        );
      },
    );

    // Services
    appLocator.registerLazySingleton<ToastService>(() => ToastService());

    // Providers
    appLocator.registerLazySingleton<QuizProvider>(
      () => QuizApiProvider(
        appLocator<DioConfig>().dio,
      ),
    );
    appLocator.registerSingleton<SharedPreferencesProvider>(SharedPreferencesProvider());
    appLocator<SharedPreferencesProvider>().init();

    appLocator.registerSingleton<HiveProvider>(HiveProviderImpl());
    await appLocator<HiveProvider>().init();

    appLocator.registerLazySingleton<QuizLocalDataProvider>(
      () => QuizHiveProvider(
        appLocator<HiveProvider>().quizQuestionsBox,
        appLocator<HiveProvider>().quizCategoriesBox,
      ),
    );

    // Repositories
    appLocator.registerLazySingleton<QuizRepository>(
      () => QuizRepositoryImpl(
        quizProvider: appLocator.get<QuizProvider>(),
        quizLocalDataProvider: appLocator.get<QuizLocalDataProvider>(),
        sharedPreferencesProvider: appLocator.get<SharedPreferencesProvider>(),
      ),
    );

    // UseCases
    appLocator.registerLazySingleton<GetQuizCategoriesUseCase>(
      () => GetQuizCategoriesUseCase(
        quizRepository: appLocator.get<QuizRepository>(),
      ),
    );
    appLocator.registerLazySingleton<GetQuizQuestionsUseCase>(
      () => GetQuizQuestionsUseCase(
        quizRepository: appLocator.get<QuizRepository>(),
      ),
    );
  }
}
