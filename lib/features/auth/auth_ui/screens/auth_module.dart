library auth_module;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet_care/common_widgets/common_widgets.dart';
import 'package:pet_care/features/auth/auth_contoller/auth_provider.dart';
import 'package:pet_care/locator.dart';
import 'package:pet_care/resources/assets_manager.dart';
import 'package:pet_care/resources/colors_manager.dart';
import 'package:pet_care/resources/size_config.dart';
import 'package:pet_care/resources/strings_manager.dart';
import 'package:pet_care/resources/styles_manager.dart';
import 'package:pet_care/resources/values_manager.dart';
import 'package:pet_care/routing/routing_module.dart';
import 'package:pet_care/utils/enums.dart';
import 'package:pet_care/utils/extension/validate_extension.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

part 'forget_password_screen.dart';
part 'login_screen.dart';
part 'main_auth_screen.dart';
part 'reset_password.dart';
part 'sign_up_screen.dart';
part 'verify_email_screen.dart';