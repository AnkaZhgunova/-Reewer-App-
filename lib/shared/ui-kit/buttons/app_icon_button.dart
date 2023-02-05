import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:reewer_app/shared/export.dart';

class AppIconButton extends StatelessWidget {
  final VoidCallback onTap;
  const AppIconButton({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 20,
        width: 20,
        color: Colors.transparent,
        child: SvgPicture.asset(
          AppIcons.cross,
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}
