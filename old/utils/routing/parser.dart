part of utils;

/// Used by [TemplateRouteParser] to guard access to routes.
///
/// Override this class to change the route that is returned by
/// [TemplateRouteParser.parseRouteInformation] if a condition is not met, for
/// example, if the user is not signed in.
abstract class RouteGuard<T> {
  RouteGuard._();
  Future<T> redirect(final T from);
}

/// Parses the URI path into a [ParsedRoute].
class TemplateRouteParser<TParameters>
    extends RouteInformationParser<ParsedRoute> {
  TemplateRouteParser({
    /// The list of allowed path templates (['/', '/users/:id'])
    required final List<String> allowedPaths,
    required this.parametersFromJsonCallback,

    /// The initial route
    final String? initialRoute = '/',

    ///  [RouteGuard] used to redirect.
    final this.guards,
  }) : initialRoute = ParsedRoute.fromPathTemplate(initialRoute ?? '/') {
    for (final template in allowedPaths) {
      _addRoute(template);
    }
  }
  final TParameters Function(Map<String, dynamic> json)
      parametersFromJsonCallback;
  final List<String> _pathTemplates = [];
  List<RouteGuard<ParsedRoute<TParameters>>>? guards;
  final ParsedRoute<TParameters> initialRoute;

  void _addRoute(final String pathTemplate) {
    _pathTemplates.add(pathTemplate);
  }

  @override
  Future<ParsedRoute<TParameters>> parseRouteInformation(
    final RouteInformation routeInformation,
  ) async =>
      _parse(routeInformation);

  Future<ParsedRoute<TParameters>> _parse(
    final RouteInformation routeInformation,
  ) async {
    final path = routeInformation.location!;
    final queryParams = Uri.parse(path).queryParameters;
    var parsedRoute = initialRoute;

    for (final pathTemplate in _pathTemplates) {
      final parameters = <String>[];
      final pathRegExp = pathToRegExp(pathTemplate, parameters: parameters);
      if (pathRegExp.hasMatch(path)) {
        final match = pathRegExp.matchAsPrefix(path);
        if (match == null) continue;
        final paramsJson = extract(parameters, match);
        parsedRoute = ParsedRoute<TParameters>(
          path: path,
          pathTemplate: pathTemplate,
          parameters: parametersFromJsonCallback(paramsJson),
          queryParameters: queryParams,
        );
      }
    }

    // Redirect if a guard is present
    final guards = this.guards ?? [];
    for (final guard in guards) {
      final maybeRouteToRedirect = await guard.redirect(parsedRoute);
      final isToRedirect = maybeRouteToRedirect != parsedRoute;
      if (isToRedirect) return maybeRouteToRedirect;
    }

    return parsedRoute;
  }

  @override
  RouteInformation restoreRouteInformation(final ParsedRoute configuration) =>
      RouteInformation(location: configuration.path);
}
