import 'package:flutter/material.dart';
import 'package:reewer_app/shared/export.dart';

class UnknownAccount extends StatelessWidget {
  static const routeName = '/unknown_account';
  const UnknownAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Account not found',
              style: AppTextStyles.black22SemiBold600,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'We couldn’t find a Reewer account connected to that email.',
              style: AppTextStyles.black16Medium500,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 100,
            ),
            RoundButton(
              buttonText: 'Create new account',
              padding: EdgeInsets.symmetric(horizontal: 20),
            ),
          ],
        ),
      ),
    );
  }
}
