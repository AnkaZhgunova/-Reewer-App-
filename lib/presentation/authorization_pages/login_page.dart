import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:reewer_app/presentation/export.dart';
import 'package:reewer_app/shared/export.dart';
import 'package:reewer_app/utils/validator.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login_page';
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final ValueNotifier<bool> isFormValidate = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.disabled,
            onChanged: () =>
                isFormValidate.value = _formKey.currentState!.validate(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 60,
                ),
                Text(
                  'Login',
                  style: AppTextStyles.black22SemiBold600,
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 100,
                  child: AppTextField(
                    title: 'Phone',
                    hintText: 'Your phone',
                    onChanged: (_) {},
                    inputType: TextInputType.phone,
                    validator: (number) =>
                        Validator.validatePhoneNumber(number),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 1,
                      color: AppColors.lightGrey,
                      width: 132,
                    ),
                    Text(
                      'or',
                      style: AppTextStyles.grey14Medium400,
                    ),
                    Container(
                      height: 1,
                      color: AppColors.lightGrey,
                      width: 132,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                SignInButton(
                  signInType: SignInType.google,
                  onTap: () {},
                ),
                if (Platform.isIOS)
                  SignInButton(
                    signInType: SignInType.apple,
                    onTap: () {},
                  )
                else
                  SizedBox(),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not registered yet?',
                    ),
                    AppTextButton(
                      buttonText: 'Sign up',
                      textStyle: AppTextStyles.black14SemiBold600,
                    ),
                  ],
                ),
                SizedBox(
                  height: 250,
                ),
                ValueListenableBuilder(
                  valueListenable: isFormValidate,
                  builder: (BuildContext context, bool value, Widget? child) {
                    return AppButton(
                      buttonText: 'Send a code',
                      onTap: value
                          ? () {
                              Navigator.pushNamed(
                                context,
                                UnknownAccount.routeName,
                              );
                            }
                          : null,
                    );
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                Center(
                  child: AppTextButton(
                    buttonText: 'Later',
                    textStyle: AppTextStyles.black14Medium500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
