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
      //final tours = await _getToursUseCase.call(event.id);
      final tours = List<TourEntity>.generate(
        10,
        (index) => TourEntity(
          id: index,
          name: 'Tour $index',
          photo:
              'https://s3-alpha-sig.figma.com/img/d9f0/f9a4/0b9907df480b626dd3a8dd032c8292df?Expires=1718582400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=hpJI74VaRQD6zS~l7IAlvCtw7wzB9Hz4jWWhxML2QsM3T1N7raEn7YCaLwHgwaNn-pfO728RNXTWCjksyNqT9xKhQsO1zGAT0RtN-~HfrmS6sGpTY3XkG-IcnNAS8sYMacAF9Syuiv~reTQ57~OsR0q-YBN6Yj4PjUMPfxwmzr7j0A0TPdIMyMqjKkmef62jMsKa0guUCxISRXdvy~cWifP7kvEkw8GEdS2J0IaRRb3DLXmaMpz1k2flNH1eS~n6XH2VibPzZfePBNYo34PthMWonLRWslfjXW~J~~uxDXUsg0snH3POgjMeCHq~VLdtDsj4~aS75KSxMJ9sQcWncg__',
          description:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dignissim eget amet viverra eget fames rhoncus. Eget enim venenatis enim porta egestas malesuada et. Consequat mauris lacus euismod montes.',
          location: 'Honshu, Japan',
          category: 0,
        ),
      );
      emit(ToursLoaded(tours: tours, dotsLenght: tours.length));
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }

  FutureOr<void> _getCategoriesEvent(
      FetchCategories event, Emitter<AppState> emit) async {
    emit(Loading());
    try {
      //final categories = await _getCategoriesUseCase.call(1);
      final categoriesName = [
        'Popular',
        'Featured',
        'Most visited',
        'Europe',
        'Asia'
      ];
      final categories = List<CategoryEntity>.generate(
          5, (index) => CategoryEntity(id: index, name: categoriesName[index]));

      emit(CategoriesLoaded(
        categories: categories,
      ));
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }
}
