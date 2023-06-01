import 'package:flutter/material.dart';

import 'package:pet_care/features/add_pet/add_pet_core/add_pet_provider.dart';
import 'package:pet_care/features/add_pet/add_pet_ui/add_pet_widgets/gender_card.dart';
import 'package:pet_care/features/add_pet/add_pet_ui/add_pet_widgets/is_pet_neuter_widget.dart';
import 'package:pet_care/locator.dart';
import 'package:pet_care/resources/colors_manager.dart';
import 'package:pet_care/resources/size_config.dart';
import 'package:pet_care/resources/styles_manager.dart';
import 'package:pet_care/resources/values_manager.dart';
import 'package:pet_care/utils/enums.dart';
import 'package:provider/provider.dart';

class IsPetNeuterScreen extends StatelessWidget {
  IsPetNeuterScreen({
    Key? key,
  }) : super(key: key);

  SizeConfig sizeConfig = locator<SizeConfig>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: sizeConfig.getScreenWidth(AppSize.s32)),
      child: Column(
        children: [
          addVerticalSpace(sizeConfig.getScreenHeight(AppSize.s32)),
          Text(
            "Is your pet neuter?",
            textAlign: TextAlign.center,
            style: h3Bold(color: ColorManager.primary),
          ),
          addVerticalSpace(sizeConfig.getScreenHeight(AppSize.s48)),
          Consumer<AppPetProvider>(
            builder: (context, provider, child) => SizedBox(
                width: sizeConfig.getScreenWidth(220),
                height: sizeConfig.getScreenHeight(100),
                // child: ListView.separated(
                //     scrollDirection: Axis.horizontal,
                //     physics: const NeverScrollableScrollPhysics(),
                //     shrinkWrap: true,
                //     itemBuilder: (context, index) {
                //       final gender = provider.genders[index];
                //       return GenderCard(
                //         iconPath: gender.iconPath,
                //         isSelected: gender.isSelect,
                //         onTap: () => provider.selectPetGender(type: gender.type),
                //       );
                //     },
                //     separatorBuilder: (context, index) =>
                //     const SizedBox(height: AppSize.s15),
                //     itemCount: provider.genders.length),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IsPetNeuterWidget(
                      onTap: () =>
                          provider.selectOption(PetNeuterOption.neuter),
                      isSelected:
                          provider.selectedOption == PetNeuterOption.neuter
                              ? true
                              : false,
                      title: "Yes",
                    ),
                    IsPetNeuterWidget(
                      onTap: () =>
                          provider.selectOption(PetNeuterOption.notNeuter),
                      isSelected:
                          provider.selectedOption == PetNeuterOption.notNeuter
                              ? true
                              : false,
                      title: "No",
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
