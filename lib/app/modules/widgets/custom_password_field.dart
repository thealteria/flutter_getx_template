import 'package:flutter/material.dart';
import 'package:getx_start_project/app/common/util/exports.dart';
import 'package:getx_start_project/app/common/util/validators.dart';

class PasswordFieldWidget extends StatelessWidget {
  final String title, initialValue;
  final TextEditingController controller;
  final bool obscureText;
  final Function onObscureIconClick;
  final ValueChanged<String> onChanged, onSaved;
  final FormFieldValidator<String> validator;

  const PasswordFieldWidget({
    Key key,
    this.controller,
    @required this.obscureText,
    @required this.onObscureIconClick,
    this.title,
    this.onChanged,
    this.onSaved,
    this.initialValue,
    this.validator = Validators.validatePassword,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: obscureText,
      validator: validator,
      onChanged: onChanged,
      onSaved: onSaved,
      decoration: InputDecoration(
        labelText: title ?? Strings.enterPassword,
        filled: true,
        contentPadding: const EdgeInsets.all(12),
        suffixIcon: IconButton(
          onPressed: onObscureIconClick,
          color: AppColors.kPrimaryColor,
          icon: Icon(
            obscureText ? Icons.visibility_off : Icons.visibility,
          ),
        ),
      ),
    );
  }
}
