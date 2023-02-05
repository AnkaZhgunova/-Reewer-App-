import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:reewer_app/shared/export.dart';

class RoundButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onPressed;
  final String? icon;
  final EdgeInsets? padding;
  const RoundButton({
    required this.buttonText,
    this.icon,
    this.onPressed,
    this.padding = EdgeInsets.zero,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: padding,
      onPressed: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        margin: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(44),
          border: Border.all(
            color: AppColors.greyBorder,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null)
              Row(
                children: [
                  SvgPicture.asset(icon!),
                  const SizedBox(width: 10),
                ],
              )
            else
              SizedBox(),
            Text(
              buttonText,
              style: AppTextStyles.black14Medium400,
            ),
          ],
        ),
      ),
    );
  }
}
