part of common_widgets;
BoxShadow customShadow() {
  return BoxShadow(
    color: ColorManager.gray.withOpacity(0.05),
    // spreadRadius: 1,
    blurRadius: 15,
    offset: const Offset(0, 3), // changes position of shadow
  );
}