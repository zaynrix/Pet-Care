library home_ui_module;

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet_care/common_widgets/common_widgets.dart';
import 'package:pet_care/features/home/controllers/home_provider.dart';
import 'package:pet_care/features/home/widgets/star_rating_widget.dart';
import 'package:pet_care/features/profile/profile_module.dart';
import 'package:pet_care/features/reminder/models/remonder.dart';
import 'package:pet_care/features/reminder/reminder_module.dart';
import 'package:pet_care/features/shop/controllers/product_cotroller.dart';
import 'package:pet_care/features/shop/ui/screens/shop_screens.dart';
import 'package:pet_care/features/shop/ui/widgets/shop_widgets.dart';
import 'package:pet_care/locator.dart';
import 'package:pet_care/resources/assets_manager.dart';
import 'package:pet_care/resources/colors_manager.dart';
import 'package:pet_care/resources/strings_manager.dart';
import 'package:pet_care/resources/styles_manager.dart';
import 'package:pet_care/resources/values_manager.dart';
import 'package:pet_care/utils/extension/responsive_extension.dart';
import 'package:pet_care/utils/extension/time_extension.dart';
import 'package:provider/provider.dart';

part 'screens/home_screen.dart';
part 'screens/main-screen_app.dart';
