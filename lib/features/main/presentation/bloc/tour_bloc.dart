import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:travel_app/features/main/domain/use_case/tours_use_case.dart';

part 'tour_event.dart';
part 'tour_state.dart';

class TourBloc extends Bloc<TourEvent, TourState> {
  final TourUseCase _useCase;

  TourBloc(this._useCase) : super(TourLoading()) {
    on<TourFetch>(onFetchTour);
  }

  void onFetchTour(TourFetch event, Emitter<TourState> emit) async {
    try {
      final data = _useCase.call();
      emit(TourLoaded());
    } on DioException catch (e) {
      emit(TourError(error: e));
    }
  }
}
