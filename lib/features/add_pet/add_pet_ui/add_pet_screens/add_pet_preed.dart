import 'package:flutter/material.dart';
import 'package:pet_care/common_widgets/customTextFormField.dart';
import 'package:pet_care/locator.dart';
import 'package:pet_care/resources/colors_manager.dart';
import 'package:pet_care/resources/size_config.dart';
import 'package:pet_care/resources/styles_manager.dart';
import 'package:pet_care/resources/values_manager.dart';
import 'package:pet_care/utils/validate_extension.dart';

class AddPetBreedScreen extends StatelessWidget {
  AddPetBreedScreen({
    Key? key,
  }) : super(key: key);

  SizeConfig sizeConfig = locator<SizeConfig>();
  TextEditingController petNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sizeConfig.getScreenWidth(AppSize.s32)),
      child: Column(
        children: [
          addVerticalSpace(sizeConfig.getScreenHeight(AppSize.s32)),
          Text(
            "What about\n your pet’s breed?",
            textAlign: TextAlign.center,
            style: h3Bold(color: ColorManager.primary),
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
