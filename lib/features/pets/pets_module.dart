library pets_module;

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:pet_care/common_widgets/common_widgets.dart';
import 'package:pet_care/features/add_pet/add_pet_ui/add_pet_widgets/add_pet_widgets.dart';
import 'package:pet_care/locator.dart';
import 'package:pet_care/resources/assets_manager.dart';
import 'package:pet_care/resources/colors_manager.dart';
import 'package:pet_care/resources/strings_manager.dart';
import 'package:pet_care/resources/styles_manager.dart';
import 'package:pet_care/resources/values_manager.dart';
import 'package:pet_care/routing/routing_module.dart';
import 'package:pet_care/utils/extension/responsive_extension.dart';
import 'package:pet_care/utils/extension/validate_extension.dart';
import 'package:wheel_chooser/wheel_chooser.dart';

part 'controllers/pets_controller.dart';
part 'model/pet_model.dart';
part 'repositories/pet_repo.dart';
part 'ui/screens/pets_screen.dart';
part 'ui/widgets/pet_card.dart';
part 'ui/screens/edit_pet_info.dart';
part 'ui/widgets/edit_age_pet_sheet.dart';
part 'ui/widgets/edit_pet_info_card.dart';
part 'ui/widgets/edit_pet_species.dart';
part 'ui/widgets/edit_gender_pet_sheet.dart';
