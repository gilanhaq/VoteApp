import 'package:flutter/material.dart';
import 'package:jangangolputyukkapp/themes/theme.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final double width;
  final Function()? onTap;
  final EdgeInsets margin;

  const CustomButton({
    super.key,
    required this.title,
    this.width = double.infinity,
    required this.onTap,
    this.margin = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width,
      height: 55,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: primary,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: Text(
              title,
              style: whiteText.copyWith(
                fontSize: 18,
                fontWeight: medium,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
