library home_ui_module;

import 'dart:io';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet_care/common_widgets/common_widgets.dart';
import 'package:pet_care/common_widgets/custom_circularProgressIndicator.dart';
import 'package:pet_care/features/home/controllers/home_provider.dart';
import 'package:pet_care/features/home/controllers/search_provider.dart';
import 'package:pet_care/features/home/models/vets_model.dart';
import 'package:pet_care/features/home/widgets/article_card.dart';
import 'package:pet_care/features/home/widgets/star_rating_widget.dart';
import 'package:pet_care/features/home/widgets/vet_card.dart';
import 'package:pet_care/features/notification/notification_helper.dart';
import 'package:pet_care/features/notification/provider/notification_provider.dart';
import 'package:pet_care/features/profile/profile_module.dart';
import 'package:pet_care/features/reminder/reminder_module.dart';
import 'package:pet_care/features/shop/controllers/product_provider.dart';
import 'package:pet_care/features/shop/ui/screens/shop_screens.dart';
import 'package:pet_care/features/shop/ui/widgets/shop_widgets.dart';
import 'package:pet_care/locator.dart';
import 'package:pet_care/resources/assets_manager.dart';
import 'package:pet_care/resources/colors_manager.dart';
import 'package:pet_care/resources/strings_manager.dart';
import 'package:pet_care/resources/styles_manager.dart';
import 'package:pet_care/resources/values_manager.dart';
import 'package:pet_care/routing/routing_module.dart';
import 'package:pet_care/utils/extension/responsive_extension.dart';
import 'package:pet_care/utils/extension/time_extension.dart';
import 'package:pet_care/utils/extension/validate_extension.dart';
import 'package:provider/provider.dart';

import '../../pets/pets_module.dart';

part 'screens/home_screen.dart';
part 'screens/main_screen_app.dart';
part 'screens/search_screen.dart';
