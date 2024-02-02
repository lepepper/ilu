// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:ilu/page1.dart' as _i1;
import 'package:ilu/page2.dart' as _i4;
import 'package:ilu/page3.dart' as _i5;
import 'package:ilu/page4.dart' as _i2;
import 'package:ilu/page5.dart' as _i3;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.HomePage(),
      );
    },
    PostPropertyRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.PostPropertyPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.ProfilePage(),
      );
    },
    PropManagerRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.PropManagerPage(),
      );
    },
    SubscriptionRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.SubscriptionPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i2.PostPropertyPage]
class PostPropertyRoute extends _i6.PageRouteInfo<void> {
  const PostPropertyRoute({List<_i6.PageRouteInfo>? children})
      : super(
          PostPropertyRoute.name,
          initialChildren: children,
        );

  static const String name = 'PostPropertyRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.ProfilePage]
class ProfileRoute extends _i6.PageRouteInfo<void> {
  const ProfileRoute({List<_i6.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i4.PropManagerPage]
class PropManagerRoute extends _i6.PageRouteInfo<void> {
  const PropManagerRoute({List<_i6.PageRouteInfo>? children})
      : super(
          PropManagerRoute.name,
          initialChildren: children,
        );

  static const String name = 'PropManagerRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i5.SubscriptionPage]
class SubscriptionRoute extends _i6.PageRouteInfo<void> {
  const SubscriptionRoute({List<_i6.PageRouteInfo>? children})
      : super(
          SubscriptionRoute.name,
          initialChildren: children,
        );

  static const String name = 'SubscriptionRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
