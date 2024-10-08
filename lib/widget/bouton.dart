import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final Color color;
  final VoidCallback? onPressed;
  final double padding;
  final double paddingtext;
  final Widget child;
  final double width;
  final double height;

  const RoundedButton({
    super.key,
    required this.color,
    required this.onPressed,
    required this.padding,
    required this.child,
    required this.paddingtext,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(color),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(padding),
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: paddingtext),
          child: child,
        ),
      ),
    );
  }
}
