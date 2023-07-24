library shop_screens;

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pet_care/common_widgets/common_widgets.dart';
import 'package:pet_care/features/auth/auth_ui/screens/auth_module.dart';
import 'package:pet_care/features/shop/controllers/product_cotroller.dart';
import 'package:pet_care/features/shop/core/shop_controller/shop_controller.dart';
import 'package:pet_care/features/shop/models/product_model.dart';
import 'package:pet_care/features/shop/ui/widgets/shop_widgets.dart';
import 'package:pet_care/locator.dart';
import 'package:pet_care/resources/assets_manager.dart';
import 'package:pet_care/resources/colors_manager.dart';
import 'package:pet_care/resources/size_config.dart';
import 'package:pet_care/resources/styles_manager.dart';
import 'package:pet_care/resources/values_manager.dart';
import 'package:pet_care/routing/routing_module.dart';
import 'package:pet_care/utils/extension/responsive_extension.dart';
import 'package:pet_care/utils/extension/validate_extension.dart';
import 'package:provider/provider.dart';

import '../../../../resources/strings_manager.dart';

part 'add_new_card.dart';
part 'cart_screen.dart';
part 'main_shop_screen.dart';
part 'order_information.dart';
part 'order_success.dart';
part 'pharmacy_shop_screen.dart';
part 'product_details.dart';
