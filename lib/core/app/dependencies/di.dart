import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:travel_app/data/api/api.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<TourApiImp>(TourApiImp(dio: getIt<Dio>()));
}
