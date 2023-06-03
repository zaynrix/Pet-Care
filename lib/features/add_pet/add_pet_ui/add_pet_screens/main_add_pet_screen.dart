import 'package:flutter/material.dart';
import 'package:pet_care/features/add_pet/add_pet_core/add_pet_provider.dart';
import 'package:pet_care/features/add_pet/add_pet_ui/add_pet_screens/addPetNameScreen.dart';
import 'package:pet_care/features/add_pet/add_pet_ui/add_pet_screens/add_old_pet.dart';
import 'package:pet_care/features/add_pet/add_pet_ui/add_pet_screens/add_pet_gender.dart';
import 'package:pet_care/features/add_pet/add_pet_ui/add_pet_screens/add_pet_preed.dart';
import 'package:pet_care/features/add_pet/add_pet_ui/add_pet_screens/is_pat_neuter_screen.dart';
import 'package:pet_care/locator.dart';
import 'package:pet_care/resources/colors_manager.dart';
import 'package:pet_care/resources/size_config.dart';
import 'package:pet_care/resources/styles_manager.dart';
import 'package:pet_care/resources/values_manager.dart';
import 'package:pet_care/routing/route.dart';
import 'package:provider/provider.dart';

import 'add_pet_species_screen.dart';

class MainAppPetScreen extends StatefulWidget {
  MainAppPetScreen({Key? key}) : super(key: key);

  @override
  State<MainAppPetScreen> createState() => _MainAppPetScreenState();
}

class _MainAppPetScreenState extends State<MainAppPetScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<AppPetProvider>(context, listen: false)
        .initStateAddPet();
  }
  final SizeConfig sizeConfig = locator<SizeConfig>();

  final PageController controllerPages = PageController();

  TextEditingController petNameController = TextEditingController();

  final List<Widget> pages = [
    AddPetNameScreen(),
    AddPetSpeciesScreen(),
    AddPetBreedScreen(),
    AddPetGenderScreen(),
    IsPetNeuterScreen(),
    AppOldPetScreen()
  ];

  @override
  Widget build(BuildContext context) {
    debugPrint("This is inside main add pet page");
    return Consumer<AppPetProvider>(
      builder: (context , provider , child) => Scaffold(
        // resizeToAvoidBottomInset: false,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: ElevatedButton(
            onPressed: () {
              provider.controller.nextPage(
                  duration: const Duration( milliseconds: 500),
                  curve: Curves.easeInOut);
            },
            child: const Text("Next")),
        body: SafeArea(
          child: Column(
            children: [
              addVerticalSpace(sizeConfig.getScreenHeight(AppSize.s9)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: sizeConfig.getScreenWidth(AppSize.s24) ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          focusColor: ColorManager.mainBorderColor,
                          onTap: () {
                            provider.currantPage == 0 ?
                            RouteService.serviceNavi.popFunction() :
                            provider.controller.previousPage(
                                duration: const Duration( milliseconds: 250),
                                curve: Curves.easeInOut);
                          },
                          child: const Icon(
                            Icons.arrow_back,
                            size: 32,
                            color: ColorManager.primary,
                          ),
                        ),
                        Text(
                          "${provider.currantPage +1}/7",
                          style: supTitleRegular(color: ColorManager.primary),
                        )
                      ],
                    ),
                    addVerticalSpace(sizeConfig.getScreenHeight(AppSize.s24)),
                    Stack(
                      children: [
                        Container(
                          height: 6,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: const Color(0xFF3232321A),
                              borderRadius: BorderRadius.circular(AppSize.s50)),
                        ),
                        AnimatedContainer(
                          height: 6,
                          width: AppPetProvider.progressBarStatus(provider.currantPage),
                          decoration: BoxDecoration(
                              color: ColorManager.secondary,
                              borderRadius: BorderRadius.circular(AppSize.s50)),
                          duration: const Duration(milliseconds: 500),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.5,
                alignment: Alignment.center,
                child: PageView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (value) => provider.onPageChange(value),
                  itemCount: pages.length,
                controller: provider.controller,
                    itemBuilder: (context , index){
                  return pages[provider.activeIndex];
                } ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

