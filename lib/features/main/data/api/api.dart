import 'package:dio/dio.dart';
import 'package:travel_app/features/main/data/models/category.dart';

const baseUrl = 'https://atai-mamytov.click/neotour/tour';

abstract class CategoryApi {
  Future<List<CategoryModel>?> getCategories();
}

class CategoryApiImp implements CategoryApi {
  final Dio dio;

  CategoryApiImp({required this.dio});

  @override
  Future<List<CategoryModel>?> getCategories() async {
    final response = await dio.get('$baseUrl/categories/');
    if (response.statusCode == 200) {
      List<Map<String, dynamic>> jsonData = response.data;
      List<CategoryModel> categories =
          jsonData.map((value) => CategoryModel.fromJson(value)).toList();
      return categories;
    } else if (response.statusCode == 403) {
      throw ('У пользователя не хватает прав');
    } else if (response.statusCode == 404) {
      throw ('Ресурс не найден');
    }
  }
}
