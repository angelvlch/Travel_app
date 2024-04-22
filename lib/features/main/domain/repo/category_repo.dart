import 'package:travel_app/features/main/domain/entity/category_entity.dart';

abstract class CategoryRepo {
  Future<CategoryEntity> getCategories();
}
