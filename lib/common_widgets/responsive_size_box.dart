part of common_widgets;

final SizeConfig sizeConfig = sl<SizeConfig>();

class RVerticalSpace extends StatelessWidget {
  const RVerticalSpace({
    required this.height,
    Key? key
  }) : super(key: key);
  final double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: sizeConfig.getScreenHeight(height),
    );
  }
}

class RHorizontalSpace extends StatelessWidget {
  const RHorizontalSpace({
    required this.width,
    Key? key
  }) : super(key: key);

  final double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: sizeConfig.getScreenWidth(width),
    );
  }
}

