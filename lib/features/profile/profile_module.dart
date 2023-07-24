library profile_module;


import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:pet_care/common_widgets/common_widgets.dart';
import 'package:pet_care/locator.dart';
import 'package:pet_care/resources/assets_manager.dart';
import 'package:pet_care/resources/colors_manager.dart';
import 'package:pet_care/resources/size_config.dart';
import 'package:pet_care/resources/strings_manager.dart';
import 'package:pet_care/resources/styles_manager.dart';
import 'package:pet_care/resources/values_manager.dart';
import 'package:pet_care/routing/routing_module.dart';
import 'package:pet_care/utils/extension/responsive_extension.dart';
import 'package:pet_care/utils/extension/validate_extension.dart';
import 'package:table_calendar/table_calendar.dart';

part 'ui/screens/profile_screen.dart';
part 'ui/widgets/profile_tile.dart';
part 'ui/screens/edit_profile_screen.dart';
part 'ui/screens/payment_methods.dart';
part 'ui/widgets/payment_card.dart';
part 'ui/widgets/choose_payment_method_card.dart';
part 'ui/screens/address_screen.dart';
part "ui/widgets/address_card.dart";
part 'ui/screens/orders_screen.dart';
part 'ui/screens/order_detail_screen.dart';
part "ui/widgets/order_detail_card.dart";
part "ui/screens/appointments_screen.dart";
part 'ui/screens/add_new_payment_method_screen.dart';
part "ui/widgets/order_item.dart";