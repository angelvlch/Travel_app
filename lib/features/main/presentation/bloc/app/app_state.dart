part of 'app_bloc.dart';

abstract class AppState {}

class Loading extends AppState {}

class ToursLoaded extends AppState {
  final List<TourEntity> tours;
  final int dotsLenght;

  ToursLoaded({required this.tours, required this.dotsLenght});
}

class Error extends AppState {
  final String message;

  Error({required this.message});
}

class CategoriesLoaded extends AppState {
  final List<CategoryEntity> categories;

  CategoriesLoaded({
    required this.categories,
  });
}
