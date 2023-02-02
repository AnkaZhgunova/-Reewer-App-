import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:reewer_app/shared/export.dart';

class CodeField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final ValueChanged<String>? onCompleted;
  final TextEditingController? textEditingController;
  final FormFieldValidator<String>? validator;
  final StreamController<ErrorAnimationType>? errorController;
  const CodeField({
    required this.onChanged,
    this.textEditingController,
    this.validator,
    this.onCompleted,
    this.errorController,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      autoDisposeControllers: false,
      errorAnimationController: errorController,
      errorTextDirection: TextDirection.ltr,
      onCompleted: onCompleted,
      errorTextSpace: 30,
      errorTextMargin: EdgeInsets.symmetric(horizontal: 100),
      autovalidateMode: AutovalidateMode.disabled,
      validator: validator,
      mainAxisAlignment: MainAxisAlignment.center,
      cursorColor: AppColors.greyActive,
      cursorWidth: 1,
      animationType: AnimationType.scale,
      textStyle: AppTextStyles.black14Medium400,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      obscureText: false,
      appContext: context,
      length: 4,
      onChanged: onChanged,
      controller: textEditingController,
      pinTheme: PinTheme(
        inactiveColor: AppColors.greyDefault,
        errorBorderColor: AppColors.redError,
        selectedColor: AppColors.greyActive,
        activeColor: AppColors.greyActive,
        shape: PinCodeFieldShape.box,
        borderWidth: 1,
        borderRadius: BorderRadius.circular(10),
        fieldHeight: 48,
        fieldWidth: 40,
        activeFillColor: AppColors.white,
        fieldOuterPadding: EdgeInsets.symmetric(horizontal: 10),
      ),
    );
  }
}
