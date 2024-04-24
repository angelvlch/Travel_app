import 'package:travel_app/features/main/domain/entity/tour_entity.dart';

abstract class TourRepo {
  Future<List<TourEntity>> getTours(int? id);
}
