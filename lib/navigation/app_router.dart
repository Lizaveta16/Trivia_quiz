import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trivia_test_task/domain/domain.dart';
import 'package:trivia_test_task/features/main/screen/main_screen.dart';
import 'package:trivia_test_task/features/quiz/screen/quiz_screen.dart';
import 'package:trivia_test_task/features/quiz_result/screen/quiz_result_screen.dart';
import 'package:trivia_test_task/navigation/router_constants.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  GoRouter get router => _router;

  GlobalKey<NavigatorState> get navigatorKey => _rootNavigatorKey;

  final GoRouter _router = GoRouter(
    initialLocation: RouterConstants.main,
    navigatorKey: _rootNavigatorKey,
    routes: <RouteBase>[
      GoRoute(
        path: RouterConstants.main,
        name: RouterConstants.main,
        builder: (context, state) => const MainScreen(),
      ),
      GoRoute(
        path: RouterConstants.quiz,
        name: RouterConstants.quiz,
        builder: (context, state) {
          final Map<String, dynamic>? extra = state.extra as Map<String, dynamic>?;

          return QuizScreen(category: extra?['category'] as QuizCategoryModel);
        },
      ),
      GoRoute(
        path: RouterConstants.quizResult,
        name: RouterConstants.quizResult,
        builder: (context, state) {
          final Map<String, dynamic>? extra = state.extra as Map<String, dynamic>?;

          return QuizResultScreen(
            category: extra?['category'] as QuizCategoryModel,
            correctAnswersCount: extra?['correctAnswersCount'] as int,
            wrongAnswersCount: extra?['wrongAnswersCount'] as int,
          );
        },
      ),
    ],
  );
}
