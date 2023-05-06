import 'package:flutter/material.dart';
import 'package:todo/constants/theme_constants.dart';
import 'package:todo/widgets/custom_text_field.dart';

class IconTextField extends StatelessWidget {
  final Widget icon;
  final String placeholder;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;

  const IconTextField({
    Key? key,
    required this.icon,
    required this.placeholder,
    required this.controller,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 24,
          width: 24,
          child: icon,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: CustomTextField(
            placeholder: placeholder,
            controller: controller,
            validator: validator,
            style: ThemeFonts.r16,
          ),
        ),
      ],
    );
  }
}
