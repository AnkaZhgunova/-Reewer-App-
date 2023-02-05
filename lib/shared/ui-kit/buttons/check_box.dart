import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:reewer_app/shared/export.dart';

class CheckBox extends StatefulWidget {
  final ValueChanged<bool> onChanged;
  const CheckBox({
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  State<CheckBox> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
        widget.onChanged.call(isSelected);
      },
      child: Container(
        height: 22,
        width: 22,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: AppColors.greyDefault,
            width: 1,
          ),
        ),
        child: isSelected
            ? SvgPicture.asset(
                AppIcons.check,
                fit: BoxFit.scaleDown,
              )
            : SizedBox(),
      ),
    );
  }
}
