import 'package:dio/dio.dart';

abstract class TourApi {
  Future<void> getTours();
}

class TourApiImp implements TourApi {
  final Dio dio;

  TourApiImp({required this.dio});
  @override
  Future<void> getTours() {
    // TODO: implement getTours
    throw UnimplementedError();
  }
}
