import 'package:flutter/cupertino.dart';

class AppTextButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onPressed;
  final bool underline;
  final TextStyle? textStyle;
  const AppTextButton({
    required this.buttonText,
    this.onPressed,
    this.underline = true,
    this.textStyle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: textStyle?.copyWith(
            decoration:
                underline ? TextDecoration.underline : TextDecoration.none,
          ),
        ),
      ),
    );
  }
}
