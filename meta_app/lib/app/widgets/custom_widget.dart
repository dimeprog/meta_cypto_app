import 'package:flutter/material.dart';
import 'package:meta_app/presentation/Resources/color_manager.dart';

class CustomButton extends StatelessWidget {
  final Color color;
  final VoidCallback onPressed;
  final String text;
  final double? width;
  final double? height;
  final double? fontSize;
  final double? elevation;
  final Color shadowColor;
  final Color childColor;

  const CustomButton(
      {Key? key,
      this.color = Colors.white,
      this.width,
      this.height,
      this.fontSize,
      this.elevation,
      this.shadowColor = Colors.black,
      this.childColor = Colors.black,
      required this.onPressed,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: color,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: elevation),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: TextStyle(
                    color: childColor,
                    fontWeight: FontWeight.bold,
                    fontSize: fontSize),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  final Color color;
  final VoidCallback onPressed;
  final String text;
  final double? width;
  final double? height;
  final double? fontSize;
  final double? elevation;
  final Color shadowColor;
  final Color childColor;

  const CustomTextButton(
      {Key? key,
      this.color = Colors.white,
      this.width,
      this.height,
      this.fontSize,
      this.elevation,
      this.shadowColor = Colors.black,
      this.childColor = Colors.black,
      required this.onPressed,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          primary: color, shape: const StadiumBorder(), elevation: elevation),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                  color: childColor,
                  fontWeight: FontWeight.bold,
                  fontSize: fontSize),
            ),
          ],
        ),
      ),
    );
  }
}
