import 'package:flutter/material.dart';
import 'package:pet_care/features/add_pet/add_pet_core/add_pet_provider.dart';
import 'package:pet_care/resources/colors_manager.dart';
import 'package:pet_care/resources/values_manager.dart';
import 'package:provider/provider.dart';

class LinearProgressStatusBar extends StatelessWidget {
  const LinearProgressStatusBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 6,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: const Color(0xFF3232321A),
              borderRadius: BorderRadius.circular(AppSize.s50)),
        ),
        Consumer<AppPetProvider>(
          builder: (context, provider, child) => AnimatedContainer(
            height: 6,
            width: AppPetProvider.progressBarStatus(provider.currantPage),
            decoration: BoxDecoration(
                color: ColorManager.secondary,
                borderRadius: BorderRadius.circular(AppSize.s50)),
            duration: const Duration(milliseconds: 500),
          ),
        )
      ],
    );
  }
}
