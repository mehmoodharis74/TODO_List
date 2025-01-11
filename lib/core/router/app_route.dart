


import 'package:auto_route/auto_route.dart';
import 'package:todo_list/core/router/app_route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {

  @override
  RouteType get defaultRouteType => const RouteType.adaptive(); //.cupertino, .adaptive ..etc
  
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: MainRoute.page, initial: true),
    AutoRoute(page: ProjectRoute.page),
    AutoRoute(page: EditProjectRoute.page)
    
  ];
}