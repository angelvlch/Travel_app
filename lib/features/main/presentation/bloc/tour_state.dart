part of 'tour_bloc.dart';

class TourState {}

class TourLoading extends TourState {}

class TourLoaded extends TourState {}

class TourError extends TourState {
  final DioException error;

  TourError({required this.error});
}
