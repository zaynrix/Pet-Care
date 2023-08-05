part of routing_module;

  class RouteService {
  RouteService._();

  static RouteService serviceNavi = RouteService._();
  GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

  pushNamedWidget(String routeName, { Object? argument}) {
    navKey.currentState?.pushNamed(routeName, arguments: argument);
  }

  pushNamedReplacement(String routeName) {
    navKey.currentState?.pushReplacementNamed(routeName);
  }

  pop() {
    navKey.currentState?.pop();
  }

  pushNamedAndRemoveUtils(String routeName) {
    navKey.currentState?.pushNamedAndRemoveUntil(routeName, (route) => false);
  }
}
