part of 'app_routes_barrel.dart';

final GlobalKey<NavigatorState> globalNavigatorKey = GlobalKey<NavigatorState>();

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  AppRouter() : super(navigatorKey: globalNavigatorKey);

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page,initial:true),
    AutoRoute(page: NotesListRoute.page),
    AutoRoute(page: NotesDetailsRoute.page),
    AutoRoute(page: NotesFormRoute.page),
  ];
}