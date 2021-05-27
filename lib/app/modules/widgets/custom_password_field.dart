import 'package:flutter/material.dart';
import 'package:getx_start_project/app/common/util/exports.dart';
import 'package:getx_start_project/app/common/util/validators.dart';

class PasswordFieldWidget extends StatelessWidget {
  final String? title, initialValue;
  final TextEditingController? controller;
  final bool obscureText;
  final Function() onObscureIconClick;
  final ValueChanged<String?>? onChanged, onSaved;
  final Widget? prefixIcon;

  const PasswordFieldWidget({
    Key? key,
    this.controller,
    required this.obscureText,
    required this.onObscureIconClick,
    this.title,
    this.onChanged,
    this.onSaved,
    this.initialValue,
    this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: obscureText,
      validator: Validators.validatePassword,
      onChanged: onChanged,
      onSaved: onSaved,
      decoration: InputDecoration(
        labelText: title ?? Strings.enterPassword,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 5,
        ),
        prefixIconConstraints: BoxConstraints(
          maxHeight: 16.w,
          maxWidth: 51.w,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: IconButton(
          onPressed: onObscureIconClick,
          color: AppColors.kPrimaryColor,
          iconSize: 18.w,
          icon: Icon(
            obscureText ? Icons.visibility_off : Icons.visibility,
          ),
        ),
      ),
    );
  }
}
