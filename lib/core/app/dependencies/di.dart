import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:travel_app/features/main/data/data_source/api.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<CategoryApiImp>(CategoryApiImp(dio: getIt<Dio>()));
}
