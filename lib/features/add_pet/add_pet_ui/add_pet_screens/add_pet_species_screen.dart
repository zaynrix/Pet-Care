import 'package:flutter/material.dart';
import 'package:pet_care/features/add_pet/add_pet_core/add_pet_provider.dart';
import 'package:pet_care/features/add_pet/add_pet_model/add_pet_model.dart';
import 'package:pet_care/features/add_pet/add_pet_ui/add_pet_widgets/pet_species_card.dart';
import 'package:pet_care/locator.dart';
import 'package:pet_care/resources/colors_manager.dart';
import 'package:pet_care/resources/size_config.dart';
import 'package:pet_care/resources/styles_manager.dart';
import 'package:pet_care/resources/values_manager.dart';
import 'package:provider/provider.dart';

class AddPetSpeciesScreen extends StatelessWidget {
    AddPetSpeciesScreen({
    Key? key,

  }) : super(key: key);

  final SizeConfig sizeConfig = locator<SizeConfig>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: sizeConfig.getScreenHeight(350),
      child: OverflowBox(
        maxWidth: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            addVerticalSpace(sizeConfig.getScreenHeight(AppSize.s32)),
            Text(
              "What’s your pet’s\n species?",
              textAlign: TextAlign.center,
              style: h3Bold(color: ColorManager.primary),
            ),
            addVerticalSpace(sizeConfig.getScreenHeight(AppSize.s64)),
            SizedBox(
              height: sizeConfig.getScreenHeight(117),
              child: Consumer<AppPetProvider>(
                builder: (context , provider , child) => ListView.separated(
                    separatorBuilder: (context , index) => SizedBox(width: sizeConfig.getScreenWidth(AppSize.s15),),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: provider.types.length,
                    itemBuilder: (context, index) {
                      final type = provider.types[index];
                      return  PetSpeciesCard(
                        onTap: (){
                          provider.selectPetType(type: type.name);
                        },
                        isSelected: type.isSelect,
                        type: type.name,
                        iconPath: type.iconPath,
                        backgroundColor: type.backgroundColor,
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
