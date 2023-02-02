import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reewer_app/shared/export.dart';

class AppTextField extends StatelessWidget {
  final String? title;
  final Color titleTextColor;
  final int? maxLength;
  final int errorMaxLines;
  final String? hintText;
  final double radius;
  final bool centerText;
  final bool? password;
  final bool enabled;
  final bool showError;
  final TextInputType? inputType;
  final int maxLines;
  final ValueChanged<String>? onChanged;
  final TextEditingController? textEditingController;
  final bool? isTextAlignCenter;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? filterTextInput;
  const AppTextField({
    required this.onChanged,
    this.enabled = true,
    this.radius = 10.0,
    this.centerText = false,
    this.isTextAlignCenter = false,
    this.maxLines = 1,
    this.errorMaxLines = 2,
    this.showError = true,
    this.maxLength,
    this.password,
    this.textEditingController,
    this.inputType,
    this.validator,
    this.filterTextInput,
    this.hintText,
    this.title,
    this.titleTextColor = AppColors.black,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title ?? '',
          style: AppTextStyles.black16Medium500.copyWith(color: titleTextColor),
        ),
        SizedBox(
          height: 5,
        ),
        TextFormField(
          inputFormatters: filterTextInput,
          enabled: enabled,
          validator: validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          maxLength: maxLength,
          textAlign: isTextAlignCenter! ? TextAlign.center : TextAlign.start,
          controller: textEditingController,
          obscureText: password ?? false,
          keyboardType: inputType ?? TextInputType.text,
          onChanged: onChanged,
          maxLines: maxLines,
          style: AppTextStyles.black14Medium400,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 15),
            counterText: '',
            hintText: hintText,
            hintStyle: AppTextStyles.grey14Medium400,
            errorStyle: showError ? null : TextStyle(height: 0),
            errorMaxLines: errorMaxLines,
            fillColor: AppColors.white,
            filled: true,
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.greyDefault),
              borderRadius: BorderRadius.circular(
                radius,
              ),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.greyDefault),
              borderRadius: BorderRadius.circular(
                radius,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.greyDefault),
              borderRadius: BorderRadius.circular(
                radius,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.greyActive,
              ),
              borderRadius: BorderRadius.circular(
                radius,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.redError),
              borderRadius: BorderRadius.circular(
                radius,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.redError),
              borderRadius: BorderRadius.circular(
                radius,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
