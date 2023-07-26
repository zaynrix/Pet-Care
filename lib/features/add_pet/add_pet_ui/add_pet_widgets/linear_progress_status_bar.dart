part of add_pet_widgets;

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
        GetBuilder<AddPetController>(
          builder: (GetxController controller) => AnimatedContainer(
            height: 6,
            width: AddPetController.progressBarStatus(),
            decoration: BoxDecoration(
                color: ColorManager.secondary,
                borderRadius: BorderRadius.circular(AppSize.s50)),
            duration: const Duration(milliseconds: 350),
          ),
        )
      ],
    );
  }
}
