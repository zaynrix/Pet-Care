import 'package:flutter/material.dart';
import 'package:pet_care/features/add_pet/add_pet_core/add_pet_provider.dart';
import 'package:pet_care/features/add_pet/add_pet_ui/add_pet_widgets/pet_species_card.dart';
import 'package:pet_care/locator.dart';
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
    debugPrint("This is inside the add pet species build page ");
    return SizedBox(
      // width: MediaQuery.of(context).size.width,
      // height: sizeConfig.getScreenHeight(350),
      child: Column(
        children: [
          const Text(
            "What’s your pet’s\n species?",
            textAlign: TextAlign.center,
            style: h3Bold,
          ),
          addVerticalSpace(sizeConfig.getScreenHeight(AppSize.s64)),
          Expanded(
            child: Consumer<AppPetProvider>(
              builder: (context, provider, child) => ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: provider.types.length,
                  itemBuilder: (context, index) {
                    final type = provider.types[index];
                    return PetSpeciesCard(
                      onTap: () {
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
    );
  }
}
