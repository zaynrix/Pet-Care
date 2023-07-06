part of common_widgets;

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.suffixPressed,
    required this.controller,
    required this.validator,
    this.inputFormatters,
    this.keyBoardType,
  });

  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType? keyBoardType;
  final IconData? suffixIcon;
  final Function()? suffixPressed;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          customShadow(),
        ],
      ),
      child: TextFormField(
        inputFormatters: inputFormatters,
        keyboardType: keyBoardType,
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: suffixIcon != null
              ? IconButton(
                  icon: Icon(
                    suffixIcon,
                  ),
                  onPressed: suffixPressed)
              : null,
        ),
      ),
    );
  }
}
