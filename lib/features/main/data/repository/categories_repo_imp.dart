import 'package:travel_app/features/main/data/data_source/api.dart';
import 'package:travel_app/features/main/domain/entity/category_entity.dart';
import 'package:travel_app/features/main/domain/repo/category_repo.dart';

class CategoryRepoImpl implements CategoryRepo {
  final CategoryApiImp dataSource;
  const CategoryRepoImpl({required this.dataSource});

  @override
  Future<List<CategoryEntity>> getCategories() async {
    final model = await dataSource.getCategories();
    final categories = model
        .map((model) => CategoryEntity(
              id: model.id,
              name: model.name,
            ))
        .toList();
    return categories;
  }
}
