import 'package:flutter/material.dart';
import 'package:pet_care/features/auth/auth_ui/screens/forget_password_screen.dart';
import 'package:pet_care/features/auth/auth_ui/screens/main_auth_screen.dart';
import 'package:pet_care/features/auth/auth_ui/screens/reset_password.dart';
import 'package:pet_care/features/auth/auth_ui/screens/verify_email_screen.dart';
import 'package:pet_care/routing/route_generator.dart';


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
        default:
        throw const FormatException("Route not found");
    }
  }
}