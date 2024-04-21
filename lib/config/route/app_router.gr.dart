// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:travel_app/features/main/domain/entity/tour_entity.dart' as _i7;
import 'package:travel_app/features/boarding/presentation/view/boarding_screen.dart'
    as _i1;
import 'package:travel_app/features/main/presentation/view/main_screen.dart'
    as _i2;
import 'package:travel_app/features/place/presentation/view/place_screen.dart'
    as _i3;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    EnterRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.BoardingScreen(),
      );
    },
    MainRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.MainScreen(),
      );
    },
    PlaceRoute.name: (routeData) {
      final args = routeData.argsAs<PlaceRouteArgs>();
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.PlaceScreen(
          key: args.key,
          tour: args.tour,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.BoardingScreen]
class EnterRoute extends _i5.PageRouteInfo<void> {
  const EnterRoute({List<_i5.PageRouteInfo>? children})
      : super(
          EnterRoute.name,
          initialChildren: children,
        );

  static const String name = 'EnterRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.MainScreen]
class MainRoute extends _i5.PageRouteInfo<void> {
  const MainRoute({List<_i5.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i3.PlaceScreen]
class PlaceRoute extends _i5.PageRouteInfo<PlaceRouteArgs> {
  PlaceRoute({
    _i6.Key? key,
    required _i7.TourEntity tour,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          PlaceRoute.name,
          args: PlaceRouteArgs(
            key: key,
            tour: tour,
          ),
          initialChildren: children,
        );

  static const String name = 'PlaceRoute';

  static const _i5.PageInfo<PlaceRouteArgs> page =
      _i5.PageInfo<PlaceRouteArgs>(name);
}

class PlaceRouteArgs {
  const PlaceRouteArgs({
    this.key,
    required this.tour,
  });

  final _i6.Key? key;

  final _i7.TourEntity tour;

  @override
  String toString() {
    return 'PlaceRouteArgs{key: $key, tour: $tour}';
  }
}
