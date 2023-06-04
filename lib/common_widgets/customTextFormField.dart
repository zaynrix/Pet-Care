import 'package:flutter/material.dart';
import 'package:pet_care/resources/colors_manager.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key,
    required this.hintText,
    required this.controller,
    required this.validator,
    required this.keyBoardType
  });

  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType keyBoardType;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: ColorManager.gray.withOpacity(0.05),
            // spreadRadius: 1,
            blurRadius: 15,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: TextFormField(
        keyboardType: keyBoardType,
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
        ),
      ),
    );
  }
}