import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getx_start_project/app/common/util/validators.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final String labelText, initialValue;
  final Widget prefixIcon, suffixIcon;
  final TextInputType keyboardType;
  final FormFieldValidator<String> validator;
  final TextEditingController controller;
  final ValueChanged<String> onChanged, onSaved;
  final int maxLength, maxLines, minLines;
  final bool readOnly;
  final Function onTap;
  final InputBorder border;

  const CustomTextFieldWidget({
    Key key,
    @required this.labelText,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.validator = Validators.validateEmpty,
    this.onChanged,
    this.onSaved,
    this.maxLength,
    this.maxLines = 1,
    this.minLines = 1,
    this.initialValue,
    this.readOnly = false,
    this.onTap,
    this.border,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      readOnly: readOnly,
      initialValue: initialValue,
      keyboardType: keyboardType,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      minLines: minLines,
      maxLines: maxLines,
      onSaved: onSaved,
      inputFormatters: maxLength == null
          ? null
          : [
              LengthLimitingTextInputFormatter(maxLength),
              if (keyboardType == TextInputType.number)
                FilteringTextInputFormatter.digitsOnly,
            ],
      decoration: InputDecoration(
        filled: true,
        border: border,
        enabledBorder: border,
        alignLabelWithHint: maxLines == null,
        contentPadding: const EdgeInsets.all(12),
        labelText: (controller?.text != null || !readOnly) ? labelText : null,
        hintText: readOnly ? labelText : null,
        prefixIcon: prefixIcon,
        suffixIcon: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: suffixIcon,
        ),
        suffixIconConstraints: BoxConstraints(
          maxHeight: 40.h,
          maxWidth: 40.w,
        ),
      ),
    );
  }
}
