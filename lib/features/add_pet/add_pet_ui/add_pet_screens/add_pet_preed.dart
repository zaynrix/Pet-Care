import 'package:flutter/material.dart';
import 'package:pet_care/common_widgets/common_widgets.dart';
import 'package:pet_care/locator.dart';
import 'package:pet_care/resources/colors_manager.dart';
import 'package:pet_care/resources/size_config.dart';
import 'package:pet_care/resources/styles_manager.dart';
import 'package:pet_care/resources/values_manager.dart';
import 'package:pet_care/utils/validate_extension.dart';

import 'abstract_page_widget.dart';

class AddPetBreedScreen extends StatelessWidget implements PageWidget{
  AddPetBreedScreen({
    Key? key,
  }) : super(key: key);

  SizeConfig sizeConfig = locator<SizeConfig>();
  TextEditingController petNameController = TextEditingController();
  @override
  void onPressedFunction() {
    debugPrint('Page AddPetBreedScreen action');
    // Add your custom functionality for Page 1 here
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("This is indie build in add Breed");
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sizeConfig.getScreenWidth(AppSize.s32)),
      child: Column(
        children: [
          const Text(
            "What about\n your pet’s breed?",
            textAlign: TextAlign.center,
            style: h3Bold,
          ),
          addVerticalSpace(sizeConfig.getScreenHeight(AppSize.s24)),
          CustomTextFormField(
            hintText: "Type pet's breed",
            validator: (String? value) => value!.validateUserName(),
            keyBoardType: TextInputType.name,
            controller: petNameController,
          )
        ],
      ),
    );
  }
}
