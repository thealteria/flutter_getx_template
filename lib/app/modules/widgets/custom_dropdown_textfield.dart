import 'package:flutter/material.dart';
import 'package:getx_start_project/app/common/util/exports.dart';
import 'package:getx_start_project/app/common/util/validators.dart';

class CustomDropdownTextField<T> extends StatelessWidget {
  final String title;
  final ValueChanged<T?> onChanged;
  final FormFieldSetter<T>? onSaved;
  final List<T> dataList;
  final String Function(T data)? item;
  final double? width;
  final T? value;
  final double? textFontSize;

  const CustomDropdownTextField({
    Key? key,
    required this.title,
    required this.dataList,
    required this.item,
    required this.onChanged,
    this.onSaved,
    this.width,
    this.value,
    this.textFontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return dataList.isNotEmpty
        ? SizedBox(
            width: width?.w,
            child: DropdownButtonFormField<T>(
              isExpanded: true,
              icon: const Icon(Icons.arrow_drop_down),
              value: value,
              decoration: InputDecoration(
                filled: true,
                hintText: value == null ? '' : item!(value!),
                labelText: title,
                hintStyle: AppTextStyle.regularStyle.copyWith(
                  fontSize: textFontSize ?? Dimens.fontSize14,
                  color: AppColors.mineShaft,
                ),
                floatingLabelBehavior: value == null || item == null
                    ? FloatingLabelBehavior.never
                    : FloatingLabelBehavior.always,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: Validators.validateTEmpty,
              onChanged: onChanged,
              onSaved: onSaved,
              items: dataList
                  .map<DropdownMenuItem<T>>(
                    (e) => DropdownMenuItem<T>(
                      value: e,
                      child: Text(
                        item!(e),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyle.regularStyle.copyWith(
                          fontSize: textFontSize ?? Dimens.fontSize14,
                          color: AppColors.mineShaft,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          )
        : const SizedBox.shrink();
  }
}
