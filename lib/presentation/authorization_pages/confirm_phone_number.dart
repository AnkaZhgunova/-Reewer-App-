import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:reewer_app/presentation/export.dart';
import 'package:reewer_app/shared/export.dart';
import 'package:reewer_app/utils/validator.dart';

class ConfirmPhoneNumber extends StatefulWidget {
  static const routeName = '/confirm_phone';
  const ConfirmPhoneNumber({Key? key}) : super(key: key);

  @override
  State<ConfirmPhoneNumber> createState() => _ConfirmPhoneNumberState();
}

class _ConfirmPhoneNumberState extends State<ConfirmPhoneNumber> {
  final _formKey = GlobalKey<FormState>();
  StreamController<ErrorAnimationType>? errorController =
      StreamController<ErrorAnimationType>();

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 60,
                ),
                Text(
                  'Confirm your phone',
                  style: AppTextStyles.black22SemiBold600,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'We send a code to the phone 0585538241',
                  style: AppTextStyles.black14Medium400,
                ),
                AppTextButton(
                  buttonText: 'Change',
                  onPressed: () => Navigator.pop(context),
                  textStyle: AppTextStyles.black14SemiBold600.copyWith(
                    color: AppColors.blueGradient,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: Text(
                    'Verification code',
                    style: AppTextStyles.black14Medium500,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CodeField(
                  onChanged: (String value) {},
                  errorController: errorController,
                  validator: (value) => Validator.validatePinCode(
                    value,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Didn’t get the code? ',
                      style: AppTextStyles.black14Medium400,
                    ),
                    AppTextButton(
                      buttonText: 'Send again',
                      textStyle: AppTextStyles.black14SemiBold600,
                    ),
                  ],
                ),
                Spacer(),
                AppButton(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushNamed(context, BottomBar.routeName);
                    } else {
                      errorController!.add(ErrorAnimationType.shake);
                    }
                  },
                  buttonText: 'Login',
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
