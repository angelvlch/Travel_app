
import 'package:travel_app/core/app/use_case/use_case.dart';
import 'package:travel_app/domain/entity/tour_entity.dart';
import 'package:travel_app/domain/repo/repo.dart';

class TourUseCase extends UseCase<TourEntity,void>{
  final TourRepo repo;

  TourUseCase({required this.repo});
  @override
  Future<TourEntity> call(void params)async {
    d
  }

}