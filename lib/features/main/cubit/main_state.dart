part of 'main_cubit.dart';

class MainState extends Equatable {
  final bool isLoading;
  final List<QuizCategoryModel> categories;

  const MainState({
    this.isLoading = false,
    this.categories = const [],
  });

  MainState copyWith({
    bool? isLoading,
    List<QuizCategoryModel>? categories,
  }) {
    return MainState(
      isLoading: isLoading ?? this.isLoading,
      categories: categories ?? this.categories,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        categories,
      ];
}
