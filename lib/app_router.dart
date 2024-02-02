import 'package:auto_route/auto_route.dart';
import 'package:ilu/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';



@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: PropManagerRoute.page),
        AutoRoute(page: SubscriptionRoute.page),
        AutoRoute(page: PostPropertyRoute.page),
        AutoRoute(page: ProfileRoute.page),
      ];

// MaterialApp get materialApp => MaterialApp.router(
//         title: 'Convex bar demo',
//         theme: ThemeData(primarySwatch: Colors.blue),
//         routeInformationParser: routeInformationParser,
//         routerDelegate: routerDelegate,
//         routeInformationProvider: routeInformationProvider,
//       );
}
