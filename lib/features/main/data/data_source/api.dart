import 'package:dio/dio.dart';
import 'package:travel_app/features/main/data/models/category.dart';
import 'package:travel_app/features/main/data/models/tour_model.dart';

const baseUrl = 'https://atai-mamytov.click/neotour/tour';

abstract class CategoryApi {
  Future<List<CategoryModel>> getCategories();
}

class CategoryApiImp implements CategoryApi {
  final Dio dio;

  CategoryApiImp({required this.dio});

  @override
  Future<List<CategoryModel>> getCategories() async {
    final response = await dio.get('$baseUrl/categories/');
    if (response.statusCode == 200) {
      final jsonData = response.data;
      final categories = jsonData
          .map<CategoryModel>((value) => CategoryModel.fromJson(value))
          .toList();
      return categories;
    } else if (response.statusCode == 403) {
      throw Exception('У пользователя не хватает прав');
    } else if (response.statusCode == 404) {
      throw Exception('Ресурс не найден');
    }
    throw Exception('Неожиданный статус код ${response.statusCode}');
  }
}

abstract class TourApi {
  Future<List<TourModel>> getTourCategories(int id);
}

class TourCategoryApiImp implements TourApi {
  final Dio dio;

  TourCategoryApiImp({required this.dio});

  @override
  Future<List<TourModel>> getTourCategories(int id) async {
    final response = await dio.get('$baseUrl/tours/?category_id=$id');
    if (response.statusCode == 200) {
      final jsonData = response.data['results'];
      final tours = jsonData
          .map<TourModel>(
              (value) => TourModel.fromJson(value as Map<String, dynamic>))
          .toList();
      print('f');
      return tours;
    } else if (response.statusCode == 403) {
      throw Exception('У пользователя не хватает прав');
    } else if (response.statusCode == 404) {
      throw Exception('Ресурс не найден');
    }
    throw Exception('Неожиданный статус код ${response.statusCode}');
  }
}
