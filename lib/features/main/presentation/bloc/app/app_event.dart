part of 'app_bloc.dart';

abstract class CategoryEvent {}

class FetchCategoriesTours extends CategoryEvent {
  final int id;

  FetchCategoriesTours({required this.id});
}

class FetchCategories extends CategoryEvent {}

class UpdateDotsIndicators extends CategoryEvent {
  final int id;
  final int length;
  UpdateDotsIndicators(this.length, {required this.id});
}
