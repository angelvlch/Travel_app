part of 'category_bloc.dart';

abstract class CategoryState {}

class Loading extends CategoryState {}

class ToursLoaded extends CategoryState {
  final List<TourEntity> tours;
  ToursLoaded({required this.tours});
}

class Error extends CategoryState {
  final String message;

  Error({required this.message});
}

class CategoriesLoaded extends CategoryState {
  final List<CategoryEntity> categories;

  CategoriesLoaded({required this.categories});
}

class CurrentDot extends CategoryState {
  final int currentNumber;
  final int length;
  CurrentDot(this.length, {required this.currentNumber});
}
