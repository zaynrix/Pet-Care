library add_shop_screens;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_care/common_widgets/common_widgets.dart';
import 'package:pet_care/features/add_pet/add_pet_core/add_pet_provider.dart';
import 'package:pet_care/features/add_pet/add_pet_ui/add_pet_widgets/gender_card.dart';
import 'package:pet_care/features/add_pet/add_pet_ui/add_pet_widgets/gradient_circle_line.dart';
import 'package:pet_care/features/add_pet/add_pet_ui/add_pet_widgets/is_pet_neuter_widget.dart';
import 'package:pet_care/features/add_pet/add_pet_ui/add_pet_widgets/linear_progress_status_bar.dart';
import 'package:pet_care/features/add_pet/add_pet_ui/add_pet_widgets/pet_species_card.dart';
import 'package:pet_care/locator.dart';
import 'package:pet_care/resources/assets_manager.dart';
import 'package:pet_care/resources/colors_manager.dart';
import 'package:pet_care/resources/size_config.dart';
import 'package:pet_care/resources/styles_manager.dart';
import 'package:pet_care/resources/values_manager.dart';
import 'package:pet_care/routing/routing_imports.dart';
import 'package:pet_care/utils/enums.dart';
import 'package:pet_care/utils/validate_extension.dart';
import 'package:provider/provider.dart';
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