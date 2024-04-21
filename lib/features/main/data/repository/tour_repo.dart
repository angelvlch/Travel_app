import 'package:travel_app/features/main/data/api/api.dart';
import 'package:travel_app/features/main/domain/repo/repo.dart';

class TourRepoImp implements TourRepo {
  final TourApiImp dataSource;

  TourRepoImp({required this.dataSource});
  @override
  Future<void> getTours() async {}
}
