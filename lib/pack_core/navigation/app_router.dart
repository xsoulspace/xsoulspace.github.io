import 'package:app_core/app_core.dart';

/// !If you want to add new route, please add the route to the [routes]
class NavigationRoutes {
  NavigationRoutes._();
  static const home = '/';
  static const project = '/project/:projectId';
  static const projectLinks = '/project/:projectId/links';
  static const routes = [home, project, projectLinks];
}

class AppRouterController extends RouterController {
  AppRouterController.use(super.read) : super.use();
  AppRouterController.local(super.routeState) : super.local();

  void toHome() => to(NavigationRoutes.home);
  void toProject({required final ProjectModelId id}) =>
      to('${NavigationRoutes.project}/$id');
  void toProjectLinks({required final ProjectModelId id}) =>
      to('${NavigationRoutes.home}/$id/links');
}
