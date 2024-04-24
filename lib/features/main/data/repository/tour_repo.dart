import 'package:travel_app/features/main/data/data_source/api.dart';
import 'package:travel_app/features/main/domain/entity/tour_entity.dart';
import 'package:travel_app/features/main/domain/repo/repo.dart';

class TourRepoImpl implements TourRepo {
  final TourCategoryApiImp dataSource;
  const TourRepoImpl({required this.dataSource});

  @override
  Future<List<TourEntity>> getTours(int? id) async {
    final model = await dataSource.getTourCategories(id!);
    final tours = model
        .map<TourEntity>((model) => TourEntity(
              id: model.id,
              name: model.name,
              photo: model.photo,
              location: model.location,
              category: model.id,
              description: model.description,
            ))
        .toList();
    return tours;
  }
}
