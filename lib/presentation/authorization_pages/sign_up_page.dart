import 'package:flutter/material.dart';
import 'package:reewer_app/presentation/export.dart';
import 'package:reewer_app/shared/export.dart';
import 'package:reewer_app/utils/validator.dart';

class SignUpPage extends StatefulWidget {
  static const routeName = '/sign_up_page';
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final ValueNotifier<bool> isFormValidate = ValueNotifier(false);
  bool isChecked = false;

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
          onChanged: () =>
              isFormValidate.value = _formKey.currentState!.validate(),
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20),
            children: [
              SizedBox(
                height: 60,
              ),
              Text(
                'Sign up',
                style: AppTextStyles.black22SemiBold600,
              ),
              SizedBox(
                height: 35,
              ),
              AppTextField(
                title: 'Phone',
                onChanged: (_) {},
                inputType: TextInputType.phone,
                validator: (number) => Validator.validatePhoneNumber(number),
              ),
              AppTextField(
                title: 'Email',
                onChanged: (_) {},
                inputType: TextInputType.emailAddress,
                validator: (email) => Validator.validateEmail(email),
              ),
              AppTextField(
                title: 'Full name',
                onChanged: (_) {},
                validator: (name) => Validator.validateFullName(name),
              ),
              CountryField(
                onChanged: (value) {},
              ),
              AppTextField(
                title: 'City',
                onChanged: (_) {},
              ),
              AppTextField(
                title: 'Address',
                onChanged: (_) {},
              ),
              Row(
                children: [
                  CheckBox(
                    onChanged: (bool value) {
                      setState(() {
                        isChecked = value;
                      });
                    },
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    'I have read the ',
                    style: AppTextStyles.black14Medium400,
                  ),
                  AppTextButton(
                    buttonText: 'terms of use',
                    textStyle: AppTextStyles.black14SemiBold600,
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        TermsPage.routeName,
                      );
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have a user? ',
                    style: AppTextStyles.black14Medium400,
                  ),
                  AppTextButton(
                    buttonText: 'Login',
                    textStyle: AppTextStyles.black14SemiBold600,
                    onPressed: () => Navigator.pushNamed(
                      context,
                      LoginPage.routeName,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              ValueListenableBuilder(
                valueListenable: isFormValidate,
                builder: (BuildContext context, bool value, Widget? child) {
                  return AppButton(
                    onTap: value && isChecked
                        ? () {
                            Navigator.pushNamed(context, BottomBar.routeName);
                          }
                        : null,
                    buttonText: 'Sign up',
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
              SizedBox(
                height: 35,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
