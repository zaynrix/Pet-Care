library article_module;

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pet_care/common_widgets/common_widgets.dart';
import 'package:pet_care/locator.dart';
import 'package:pet_care/resources/assets_manager.dart';
import 'package:pet_care/resources/colors_manager.dart';
import 'package:pet_care/resources/strings_manager.dart';
import 'package:pet_care/resources/styles_manager.dart';
import 'package:pet_care/resources/values_manager.dart';
import 'package:pet_care/routing/routing_module.dart';
import 'package:pet_care/utils/enums.dart';
import 'package:pet_care/utils/extension/responsive_extension.dart';
import 'package:provider/provider.dart';

part 'ui/screens/article-detail.dart';
part 'ui/screens/find_article.dart';
part 'model/article_model.dart';
part 'ui/widgets/article_card.dart';
part 'repositories/article_repo.dart';
part 'controller/article_controller.dart';