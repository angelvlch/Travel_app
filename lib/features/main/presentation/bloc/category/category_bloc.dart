import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/features/main/domain/entity/category_entity.dart';
import 'package:travel_app/features/main/domain/use_case/categories_use_case.dart';

part 'category_event.dart';
part 'category_state.dart';

class AppBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryUseCase _getCategoriesUseCase;

  AppBloc(this._getCategoriesUseCase) : super(CategoryLoading()) {
    on<FetchCategories>(_getCategoriesEvent);
  }

  FutureOr<void> _getCategoriesEvent(
      FetchCategories event, Emitter<CategoryState> emit) async {
    emit(CategoryLoading());
    try {
      final categories = await _getCategoriesUseCase.call();
      emit(CategoryLoaded(categories: categories));
    } catch (e) {
      emit(CategoryError(message: e.toString()));
    }
  }
}
