import 'package:flutter/material.dart';
import 'package:flutter_miniproject/module/screens/homes_screen.dart';
import 'package:flutter_miniproject/module/screens/authentication_screen.dart';

class RouteGenerator {
  static const String loginRoute = '/mealplanner';
  static const String homeRoute = '/mealplanner/home';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginRoute:
        return MaterialPageRoute(
          builder: (context) => _RouteHandler(routeWidget: LoginPage()),
          settings: settings,
        );
      case homeRoute:
        return MaterialPageRoute(
          builder: (context) => _RouteHandler(routeWidget: HomePage()),
          settings: settings,
        );

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
        builder: (context) => Scaffold(
            appBar: AppBar(title: Text('Error')),
            body: Center(
              child: Text('Page not found!'),
            )));
  }
}

class _RouteHandler extends StatelessWidget {
  final Widget routeWidget;

  const _RouteHandler({Key? key, required this.routeWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return routeWidget;
  }
}
