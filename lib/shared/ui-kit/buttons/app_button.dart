import 'package:flutter/cupertino.dart';
import 'package:reewer_app/shared/export.dart';

class AppButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String buttonText;
  final double? height;
  final double? width;
  const AppButton({
    required this.onTap,
    required this.buttonText,
    this.height = 45,
    this.width = double.infinity,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onTap,
      disabledColor: AppColors.greyDisabled,
      child: Container(
        height: height,
        alignment: Alignment.center,
        width: width,
        decoration: BoxDecoration(
          gradient: onTap == null
              ? LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                    AppColors.greyDisabled,
                    AppColors.greyDisabled,
                  ],
                )
              : LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                    AppColors.purpleGradient,
                    AppColors.blueGradient,
                  ],
                ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          buttonText,
          style: AppTextStyles.white16Medium500,
        ),
      ),
    );
  }
}
