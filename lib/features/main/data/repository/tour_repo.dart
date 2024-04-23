import 'package:travel_app/features/main/data/data_source/api.dart';
import 'package:travel_app/features/main/domain/repo/repo.dart';

class TourRepoImp implements TourRepo {
  final CategoryApiImp dataSource;

  TourRepoImp({required this.dataSource});
  @override
  Future<void> getTours() async {}
}
