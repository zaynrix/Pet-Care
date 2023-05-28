import 'package:flutter/material.dart';
import 'package:pet_care/features/auth/ui/screens/forget_password_screen.dart';
import 'package:pet_care/features/auth/ui/screens/verify_email_screen.dart';
import 'package:pet_care/routing/route_generator.dart';


class RoutsGenerate{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case RouteGenerator.forgetPassword:
        return MaterialPageRoute(builder: (_) => ForgetPasswordScreen());
      case RouteGenerator.verifyEmail:
        return MaterialPageRoute(builder: (_) => VerifyEmailScreen());
        default:
        throw const FormatException("Route not found");
    }
  }
}