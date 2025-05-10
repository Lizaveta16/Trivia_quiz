import 'package:hive_flutter/hive_flutter.dart';

abstract interface class HiveProvider {
  late Box<List> quizCategoriesBox;
  late Box<List> quizQuestionsBox;

  Future<void> init();

  void clear();
}
