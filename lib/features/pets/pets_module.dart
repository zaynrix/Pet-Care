library pets_module;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:pet_care/common_widgets/common_widgets.dart';
import 'package:pet_care/locator.dart';
import 'package:pet_care/resources/assets_manager.dart';
import 'package:pet_care/resources/colors_manager.dart';
import 'package:pet_care/resources/styles_manager.dart';
import 'package:pet_care/resources/values_manager.dart';
import 'package:pet_care/routing/routing_module.dart';
import 'package:pet_care/utils/extension/responsive_extension.dart';
import 'dart:convert';

part 'ui/screens/pets_screen.dart';
part 'ui/widgets/pet_card.dart';
part 'model/pet_model.dart';
part 'repositories/pet_repo.dart';
part 'controllers/pets_controller.dart';
