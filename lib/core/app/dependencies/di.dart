import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:travel_app/features/main/data/data_source/api.dart';
import 'package:travel_app/features/main/data/repository/categories_repo_imp.dart';
import 'package:travel_app/features/main/data/repository/tour_repo.dart';
import 'package:travel_app/features/main/domain/use_case/categories_use_case.dart';
import 'package:travel_app/features/main/domain/use_case/tours_use_case.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerSingleton<Dio>(Dio());

  getIt.registerSingleton<CategoryApiImp>(CategoryApiImp(dio: getIt<Dio>()));
  getIt.registerSingleton<CategoryRepoImpl>(
      CategoryRepoImpl(dataSource: getIt<CategoryApiImp>()));
  getIt.registerSingleton<CategoryUseCase>(
      CategoryUseCase(repo: getIt<CategoryRepoImpl>()));

  getIt.registerSingleton<TourCategoryApiImp>(
      TourCategoryApiImp(dio: getIt<Dio>()));
  getIt.registerSingleton<TourRepoImpl>(
      TourRepoImpl(dataSource: getIt<TourCategoryApiImp>()));
  getIt
      .registerSingleton<TourUseCase>(TourUseCase(repo: getIt<TourRepoImpl>()));
}
