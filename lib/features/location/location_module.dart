library location_module;

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pet_care/common_widgets/common_widgets.dart';
import 'package:pet_care/common_widgets/custom_circularProgressIndicator.dart';
import 'package:pet_care/features/location/controller/address_provider.dart';
import 'package:pet_care/locator.dart';
import 'package:pet_care/resources/assets_manager.dart';
import 'package:pet_care/resources/colors_manager.dart';
import 'package:pet_care/resources/styles_manager.dart';
import 'package:pet_care/resources/values_manager.dart';
import 'package:pet_care/routing/routing_module.dart';
import 'package:pet_care/utils/extension/responsive_extension.dart';
import 'package:provider/provider.dart';

part 'controller/location_controller.dart';
part 'ui/screens/add_address_manually.dart';
part 'ui/screens/add_new_address_screen.dart';
part 'ui/widgets/select_location_type_widget.dart';
