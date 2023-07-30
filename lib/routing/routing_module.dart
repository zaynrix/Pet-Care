library routing_module;

import 'package:flutter/material.dart';
import 'package:pet_care/features/add_pet/add_pet_ui/add_pet_screens/add_pet_screens.dart';
import 'package:pet_care/features/auth/auth_ui/screens/auth_module.dart';
import 'package:pet_care/features/auth/auth_ui/screens/splash_screen.dart';
import 'package:pet_care/features/home/controllers/home_provider.dart';
import 'package:pet_care/features/home/controllers/search_provider.dart';
import 'package:pet_care/features/home/ui/home_ui_module.dart';
import 'package:pet_care/features/home/ui/screens/all_pet_product.dart';
import 'package:pet_care/features/home/ui/screens/all_vets_doctor.dart';
import 'package:pet_care/features/location/controller/address_provider.dart';
import 'package:pet_care/features/location/location_module.dart';
import 'package:pet_care/features/pets/pets_module.dart';
import 'package:pet_care/features/profile/profile_module.dart';
import 'package:pet_care/features/reminder/reminder_module.dart';
import 'package:pet_care/features/shop/controllers/card_provider.dart';
import 'package:pet_care/features/shop/controllers/order_Inforamtion_provider.dart';
import 'package:pet_care/features/shop/controllers/product_provider.dart';
import 'package:pet_care/features/shop/ui/screens/shop_screens.dart';
import 'package:pet_care/locator.dart';
import 'package:provider/provider.dart';

part 'route_generator.dart';
part 'route_service.dart';
part 'routes_generate.dart';
