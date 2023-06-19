part of routing_imports;


class RoutsGenerate{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case RouteGenerator.forgetPasswordScreen:
        return MaterialPageRoute(builder: (_) => ForgetPasswordScreen());
      case RouteGenerator.verifyEmailScreen:
        return MaterialPageRoute(builder: (_) => VerifyEmailScreen());
      case RouteGenerator.resetPasswordScreen:
        return MaterialPageRoute(builder: (_) => ResetPasswordScreen());
      case RouteGenerator.mainAuthScreen:
        return MaterialPageRoute(builder: (_) => const MainAuthScreen());
      case RouteGenerator.mainAddPetScreen:
        return MaterialPageRoute(builder: (_) => MainAppPetScreen());
        default:
        throw const FormatException("Route not found");
    }
  }
}