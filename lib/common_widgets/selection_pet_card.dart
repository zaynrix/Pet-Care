part of common_widgets;

class SelectionPetCard extends StatelessWidget {
  const SelectionPetCard({
    required this.onTap,
    super.key,
    required this.petIndex,
    required this.imagePath,
    required this.isSelected
  });

  final int petIndex;
  final void Function()? onTap;
  final String imagePath;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap
      ,
      child: Padding(
        padding:
        const EdgeInsets.only(right: 2),
        child: Container(
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            border: isSelected
                ? Border.all(color: ColorManager.secondary, width: 2)
                : null,
            shape: BoxShape.circle,
          ),
          child: CircleAvatar(
            radius: 30,
            backgroundImage:
            CachedNetworkImageProvider(
              imagePath
            ),
          ),
        ),
      ),
    );
  }
}
