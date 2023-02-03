import 'package:flutter/material.dart';
import 'package:reewer_app/shared/export.dart';
import 'package:reewer_app/utils/constants.dart';

class TermsPage extends StatelessWidget {
  static const routeName = '/terms_page';
  const TermsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: AppColors.white,
        elevation: 1,
        leading: AppIconButton(onTap: () {
          Navigator.pop(context);
        }),
        title: Text(
          'Terms of use',
          style: AppTextStyles.black22SemiBold600,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.only(
          right: 20,
          left: 20,
          bottom: 110,
          top: 10,
        ),
        children: [
          Text(
            Constants.termsOfUse,
            style: AppTextStyles.black14Medium400,
          ),
        ],
      ),
      bottomSheet: Padding(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 15,
          bottom: 35,
        ),
        child: AppButton(
          onTap: () {},
          buttonText: 'Agree',
        ),
      ),
    );
  }
}
