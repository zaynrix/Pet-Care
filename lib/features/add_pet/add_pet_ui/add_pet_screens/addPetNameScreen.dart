import 'package:flutter/material.dart';
import 'package:pet_care/common_widgets/common_widgets.dart';
import 'package:pet_care/locator.dart';
import 'package:pet_care/resources/size_config.dart';
import 'package:pet_care/resources/styles_manager.dart';
import 'package:pet_care/resources/values_manager.dart';
import 'package:pet_care/utils/validate_extension.dart';

import 'abstract_page_widget.dart';

class AddPetNameScreen extends StatelessWidget implements PageWidget{
  AddPetNameScreen({
    Key? key,
  }) : super(key: key);

  SizeConfig sizeConfig = locator<SizeConfig>();
  TextEditingController petNameController = TextEditingController();
  @override
  void onPressedFunction() {
    debugPrint('Page AddPetNameScreen action');
    // Add your custom functionality for Page 1 here
  }
  @override
  Widget build(BuildContext context) {
    debugPrint("This is indie build in add name");
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sizeConfig.getScreenWidth(AppSize.s32)),
      child: Column(
        children: [
          const Text(
            "What’s the name\n of your pet?",
            textAlign: TextAlign.center,
            style: h3Bold,
          ),
          addVerticalSpace(sizeConfig.getScreenHeight(AppSize.s24)),
          CustomTextFormField(
            hintText: "Type Name",
            validator: (String? value) => value!.validateUserName(),
            keyBoardType: TextInputType.name,
            controller: petNameController,
          )
        ],
      ),
    );
  }
}
