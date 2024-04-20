import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  // TODO: implement routes
  List<AutoRoute> get routes => [
        AutoRoute(page: EnterRoute.page, initial: true),
        AutoRoute(page: MainRoute.page),
        //AutoRoute(page: TourCard.page),
        AutoRoute(page: PlaceRoute.page),
      ];
}
