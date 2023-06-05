import 'package:flutter/material.dart';
import 'package:pet_care/features/add_pet/add_pet_core/add_pet_provider.dart';
import 'package:pet_care/features/add_pet/add_pet_ui/add_pet_widgets/gender_card.dart';
import 'package:pet_care/locator.dart';
import 'package:pet_care/resources/size_config.dart';
import 'package:pet_care/resources/styles_manager.dart';
import 'package:pet_care/resources/values_manager.dart';
import 'package:provider/provider.dart';

import 'abstract_page_widget.dart';

class AddPetGenderScreen extends StatelessWidget implements PageWidget{
  AddPetGenderScreen({
    Key? key,
  }) : super(key: key);

  SizeConfig sizeConfig = locator<SizeConfig>();
  @override
  void onPressedFunction() {
    debugPrint('Page AddPetGenderScreen action');
    // Add your custom functionality for Page 1 here
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("This is indie build in add gender");
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: sizeConfig.getScreenWidth(AppSize.s32)),
      child: Column(
        children: [
          const Text(
            "What about\n your pet’s breed?",
            textAlign: TextAlign.center,
            style: h3Bold,
          ),
          addVerticalSpace(sizeConfig.getScreenHeight(AppSize.s48)),
          Consumer<AddPetProvider>(
            builder: (context, provider, child) => SizedBox(
              width: sizeConfig.getScreenWidth(201),
              height: sizeConfig.getScreenHeight(100),
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final gender = provider.genders[index];
                    return GenderCard(
                      iconPath: gender.iconPath,
                      isSelected: gender.isSelect,
                      onTap: () => provider.selectPetGender(type: gender.type),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: AppSize.s15),
                  itemCount: provider.genders.length),
              // child: Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     GenderCard(),
              //     GenderCard(),
              //   ],
              // )
            ),
          )
        ],
      ),
    );
  }
}
