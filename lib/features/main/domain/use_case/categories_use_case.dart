import 'package:travel_app/core/app/use_case/use_case.dart';
import 'package:travel_app/features/main/domain/entity/category_entity.dart';
import 'package:travel_app/features/main/domain/repo/category_repo.dart';

class CategoryUseCase extends UseCase<List<CategoryEntity>, void> {
  final CategoryRepo repo;

  CategoryUseCase({required this.repo});
  @override
  Future<List<CategoryEntity>> call({void params}) async {
    return await repo.getCategories();
  }
}
