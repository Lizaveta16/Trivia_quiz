import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:trivia_test_task/core/constants/db_constants.dart';
import 'package:trivia_test_task/data/entities/quiz_category_entity.dart';
import 'package:trivia_test_task/data/entities/quiz_entity.dart';

import 'hive_provider.dart';

class HiveProviderImpl implements HiveProvider {
  @override
  late Box<List> quizCategoriesBox;

  @override
  late Box<List> quizQuestionsBox;

  @override
  Future<void> init() async {
    try {
      await Hive.initFlutter();
      Hive.registerAdapter(QuizCategoryEntityAdapter());
      Hive.registerAdapter(QuizEntityAdapter());

      quizCategoriesBox = await Hive.openBox<List>(DbConstants.keyCategories);
      quizQuestionsBox = await Hive.openBox<List>(DbConstants.keyQuizQuestions);
    } catch (e, stacktrace) {
      if (kDebugMode) {
        print('#HIVE error# : $e');
        print(stacktrace);
      }
    }
  }

  @override
  void clear() {
    quizCategoriesBox.clear();
    quizQuestionsBox.clear();
  }
}
