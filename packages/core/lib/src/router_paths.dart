import '../core.dart';

/// !If you want to add new route, please add the route to the [routes]
class ScreenPaths {
  ScreenPaths._();
  static const bootstrap = '/';
  static const home = '/home';
  String projectId({required final ProjectModelId id}) => '$home/p/$id';
  String projectIdLinks({required final ProjectModelId id}) =>
      '$home/p/$id/links';
}
