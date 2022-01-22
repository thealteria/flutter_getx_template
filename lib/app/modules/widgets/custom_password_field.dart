import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/common/util/exports.dart';
import 'package:flutter_getx_template/app/common/util/validators.dart';

class PasswordFieldWidget extends StatelessWidget {
  final String? title, initialValue;
  final TextEditingController? controller;
  final bool obscureText;
  final Function() onObscureIconClick;
  final ValueChanged<String?>? onChanged, onSaved;
  final Widget? prefixIcon;
  final FormFieldValidator<String> validator;
  final TextInputAction textInputAction;

  const PasswordFieldWidget({
    Key? key,
    this.controller,
    required this.obscureText,
    required this.onObscureIconClick,
    this.title,
    this.onChanged,
    this.onSaved,
    this.initialValue,
    this.validator = Validators.validatePassword,
    this.textInputAction = TextInputAction.next,
    this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: obscureText,
      textInputAction: textInputAction,
      validator: validator,
      onChanged: onChanged,
      onSaved: onSaved,
      decoration: InputDecoration(
        labelText: title ?? Strings.password,
        prefixIcon: prefixIcon,
        suffixIcon: IconButton(
          onPressed: onObscureIconClick,
          color: AppColors.kPrimaryColor,
          icon: Icon(
            obscureText ? Icons.visibility_off : Icons.visibility,
            size: 20.w,
          ),
        ),
      ),
    );
  }
}
