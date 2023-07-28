library pets_module;

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet_care/common_widgets/common_widgets.dart';
import 'package:pet_care/locator.dart';
import 'package:pet_care/resources/assets_manager.dart';
import 'package:pet_care/resources/colors_manager.dart';
import 'package:pet_care/resources/styles_manager.dart';
import 'package:pet_care/resources/values_manager.dart';
import 'package:pet_care/utils/extension/responsive_extension.dart';

part 'controllers/pets_controller.dart';
part 'model/pet_model.dart';
part 'repositories/pet_repo.dart';
part 'ui/screens/pets_screen.dart';
part 'ui/widgets/pet_card.dart';
