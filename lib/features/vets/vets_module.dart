library vets_module;

import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:pet_care/common_widgets/common_widgets.dart';
import 'package:pet_care/features/home/widgets/star_rating_widget.dart';
import 'package:pet_care/features/vets/model/main_vets_model.dart';
import 'package:pet_care/locator.dart';
import 'package:pet_care/resources/colors_manager.dart';
import 'package:pet_care/resources/fonts-manager.dart';
import 'package:pet_care/resources/styles_manager.dart';
import 'package:pet_care/resources/values_manager.dart';
import 'package:pet_care/utils/extension/responsive_extension.dart';

part 'ui/screens/vets_screen.dart';
part 'repositories/vets_repo.dart';
part 'ui/widgets/vet_card.dart';
part 'controllers/vets_controller.dart';