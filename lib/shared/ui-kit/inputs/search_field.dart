import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:reewer_app/shared/export.dart';

class SearchField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final bool suffixIcon;
  final VoidCallback? onPressed;
  const SearchField({
    required this.controller,
    this.suffixIcon = true,
    this.onPressed,
    this.hintText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.1),
            offset: Offset(1, 1),
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
      child: TextField(
        autofocus: false,
        cursorWidth: 1,
        cursorColor: AppColors.greyActive,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.white,
          isDense: true,
          prefixIconConstraints: BoxConstraints.expand(width: 32, height: 32),
          prefixIcon: IconButton(
            icon: SvgPicture.asset(
              AppIcons.search,
            ),
            onPressed: null,
          ),
          hintText: hintText,
          hintStyle: AppTextStyles.grey14Medium400,
          suffixIcon: suffixIcon
              ? IconButton(
                  onPressed: onPressed,
                  icon: Container(
                    height: 32,
                    width: 32,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.greyBorder,
                      ),
                    ),
                    child: SvgPicture.asset(
                      AppIcons.filter,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                )
              : null,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
            borderSide: const BorderSide(
              color: AppColors.white,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
            borderSide: const BorderSide(
              color: AppColors.white,
            ),
          ),
        ),
        style: AppTextStyles.black14Medium400,
        controller: controller,
      ),
    );
  }
}
