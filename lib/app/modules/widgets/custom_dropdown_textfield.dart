import 'package:flutter/material.dart';
import 'package:getx_start_project/app/common/util/exports.dart';
import 'package:getx_start_project/app/common/util/validators.dart';

class CustomDropdownTextField<T> extends StatelessWidget {
  final String title;
  final ValueChanged<T> onChanged;
  final FormFieldSetter<T> onSaved;
  final List<T> dataList;
  final String Function(T data) item;
  final double height;

  const CustomDropdownTextField({
    Key key,
    @required this.title,
    @required this.dataList,
    @required this.item,
    @required this.onChanged,
    this.onSaved,
    this.height = 46,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
      child: DropdownButtonFormField<T>(
        isExpanded: true,
        icon: const Icon(Icons.arrow_drop_down),
        decoration: InputDecoration(
          filled: true,
          labelText: title,
          fillColor: Colors.white,
          border: 30.outlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
        ),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: Validators.validateTEmpty,
        onChanged: onChanged,
        onSaved: onSaved,
        items: dataList
                ?.map<DropdownMenuItem<T>>(
                  (e) => DropdownMenuItem<T>(
                    value: e,
                    child: Text(
                      item(e),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle.regularStyle(
                        fontSize: Dimens.fontSize14,
                        color: AppColors.mineShaft,
                      ),
                    ),
                  ),
                )
                ?.toList() ??
            [],
      ),
    );
  }
}
