import 'package:travel_app/core/app/use_case/use_case.dart';
import 'package:travel_app/features/main/domain/entity/tour_entity.dart';
import 'package:travel_app/features/main/domain/repo/repo.dart';

class TourUseCase extends UseCase<List<TourEntity>, int?> {
  final TourRepo repo;

  TourUseCase({required this.repo});
  @override
  Future<List<TourEntity>> call(int? params) async {
    return await repo.getTours(params);
  }
}
