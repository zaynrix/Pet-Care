library add_pet_module;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet_care/common_widgets/common_widgets.dart';
import 'package:pet_care/features/add_pet/add_pet_controller/add_pet_controller.dart';
import 'package:pet_care/features/add_pet/add_pet_ui/add_pet_widgets/add_pet_widgets.dart';
import 'package:pet_care/locator.dart';
import 'package:pet_care/resources/assets_manager.dart';
import 'package:pet_care/resources/colors_manager.dart';
import 'package:pet_care/resources/size_config.dart';
import 'package:pet_care/resources/strings_manager.dart';
import 'package:pet_care/resources/styles_manager.dart';
import 'package:pet_care/resources/values_manager.dart';
import 'package:pet_care/routing/routing_module.dart';
import 'package:pet_care/utils/enums.dart';
import 'package:pet_care/utils/extension/responsive_extension.dart';
import 'package:pet_care/utils/extension/validate_extension.dart';
import 'package:wheel_chooser/wheel_chooser.dart';

import 'abstract_page_widget.dart';

part 'add_old_pet.dart';
part 'add_pet_gender.dart';
part 'add_pet_preed.dart';
part 'add_pet_species_screen.dart';
part 'add_photo_for_pet.dart';
part 'add_pet_name_screen.dart';
part 'is_pat_neuter_screen.dart';
part 'main_add_pet_screen.dart';
part 'success_add_pet.dart';