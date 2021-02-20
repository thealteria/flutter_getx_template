import 'package:flutter/material.dart';
import 'package:getx_start_project/app/common/util/exports.dart';

import 'custom_text_field_widget.dart';

class CustomTimeSlotwidget extends StatelessWidget {
  final Function onRemoveField, onFromClick, onToClick;
  final TextEditingController fromController, toController;

  const CustomTimeSlotwidget({
    Key key,
    this.onRemoveField,
    @required this.fromController,
    @required this.toController,
    @required this.onFromClick,
    @required this.onToClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomTextFieldWidget(
            readOnly: true,
            controller: fromController,
            labelText: Strings.from,
            autovalidateMode: AutovalidateMode.disabled,
            onTap: onFromClick,
            border: 30.outlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.grey,
              ),
            ),
          ),
        ),
        SizedBox(width: 15.w),
        Expanded(
          child: CustomTextFieldWidget(
            readOnly: true,
            onTap: onToClick,
            controller: toController,
            labelText: Strings.to,
            autovalidateMode: AutovalidateMode.disabled,
            border: 30.outlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.grey,
              ),
            ),
          ),
        ),
        SizedBox(width: 5.w),
        IconButton(
          icon: const Icon(Icons.close),
          onPressed: onRemoveField,
        ),
      ],
    );
  }
}
