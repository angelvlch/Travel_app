import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/features/main/domain/entity/category_entity.dart';
import 'package:travel_app/features/main/domain/entity/tour_entity.dart';
import 'package:travel_app/features/main/domain/use_case/categories_use_case.dart';
import 'package:travel_app/features/main/domain/use_case/tours_use_case.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<CategoryEvent, AppState> {
  final CategoryUseCase _getCategoriesUseCase;
  final TourUseCase _getToursUseCase;

  AppBloc(this._getCategoriesUseCase, this._getToursUseCase)
      : super(Loading()) {
    on<FetchCategoriesTours>(_getToursEvent);
    on<FetchCategories>(_getCategoriesEvent);
  }

  FutureOr<void> _getToursEvent(
      FetchCategoriesTours event, Emitter<AppState> emit) async {
    emit(Loading());
    try {
      final tours = await _getToursUseCase.call(event.id);
      emit(ToursLoaded(tours: tours, dotsLenght: tours.length));
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }

  FutureOr<void> _getCategoriesEvent(
      FetchCategories event, Emitter<AppState> emit) async {
    emit(Loading());
    try {
      final categories = await _getCategoriesUseCase.call(1);

      emit(CategoriesLoaded(
        categories: categories,
      ));
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }
}
