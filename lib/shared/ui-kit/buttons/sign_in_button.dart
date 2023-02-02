import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:reewer_app/shared/export.dart';

class SignInButton extends StatelessWidget {
  final SignInType signInType;
  final VoidCallback onTap;
  const SignInButton({
    required this.signInType,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
        child: signInType.getButtonType,
      ),
    );
  }
}

enum SignInType { apple, google }

extension GetButtonType on SignInType {
  Widget get getButtonType {
    switch (this) {
      case SignInType.apple:
        {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AppIcons.appleLogo),
              SizedBox(
                width: 7,
              ),
              Text(
                'Apple',
                style: AppTextStyles.black14Medium400,
              ),
            ],
          );
        }
      case SignInType.google:
        {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AppIcons.googleLogo),
              SizedBox(
                width: 7,
              ),
              Text(
                'Google',
                style: AppTextStyles.black14Medium400,
              ),
            ],
          );
        }
      default:
        {
          return SizedBox();
        }
    }
  }
}
