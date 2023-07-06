part of routing_module;

class RoutsGenerate {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteGenerator.forgetPasswordScreen:
        return MaterialPageRoute(builder: (_) => ForgetPasswordScreen());
      case RouteGenerator.verifyEmailScreen:
        return MaterialPageRoute(builder: (_) => VerifyEmailScreen());
      case RouteGenerator.resetPasswordScreen:
        return MaterialPageRoute(builder: (_) => ResetPasswordScreen());
      case RouteGenerator.mainAuthScreen:
        return MaterialPageRoute(builder: (_) => const MainAuthScreen());
      case RouteGenerator.mainAddPetScreen:
        return MaterialPageRoute(builder: (_) => const MainAppPetScreen());
      case RouteGenerator.productDetailsScreen:
        return MaterialPageRoute(builder: (_) => const ProductDetailsScreen());
      case RouteGenerator.cartScreen:
        return MaterialPageRoute(builder: (_) => CartScreen());
      case RouteGenerator.orderInformationScreen:
        return MaterialPageRoute(builder: (_) => OrderInformationScreen());
      case RouteGenerator.addNewCardScreen:
        return MaterialPageRoute(builder: (_) => AddNewCard());
      case RouteGenerator.orderSuccess:
        return MaterialPageRoute(builder: (_) => OrderSuccess());
      default:
        throw const FormatException("Route not found");
    }
  }
}
