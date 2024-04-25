part of 'category_bloc.dart';

abstract class CategoryState {}

class Loading extends CategoryState {}

class ToursLoaded extends CategoryState {
  final List<TourEntity> tours;
  final int dotsLenght;

  ToursLoaded({required this.tours, required this.dotsLenght});
}

class Error extends CategoryState {
  final String message;

  Error({required this.message});
}

class CategoriesLoaded extends CategoryState {
  final List<CategoryEntity> categories;

  CategoriesLoaded({
    required this.categories,
  });
}

class CurrentDot extends CategoryState {
  final int currentNumber;
  final int length;
  CurrentDot(this.length, {required this.currentNumber});
}
