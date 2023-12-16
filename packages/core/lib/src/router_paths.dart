import '../core.dart';

/// !If you want to add new route, please add the route to the [routes]
class ScreenPaths {
  ScreenPaths._();
  static const loading = '/loading';
  static const home = '/home';
  static String projectId({required final ProjectModelId id}) => '$home/p/$id';
  static String projectIdPrivacy({required final ProjectModelId id}) =>
      '$home/p/$id/privacy';
  static String projectIdTerms({required final ProjectModelId id}) =>
      '$home/p/$id/terms';
  static String projectIdLinks({required final ProjectModelId id}) =>
      '$home/p/$id/links';
}
