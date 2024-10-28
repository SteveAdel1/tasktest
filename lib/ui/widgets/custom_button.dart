import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tasktest/ui/widgets/text_widget.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.function,
    this.boxShadow,
    required this.height,
    required this.width,
    this.textSize= 14,
  });

  final String text;
  final double height, width, textSize;
  final VoidCallback function;
  final List<BoxShadow>? boxShadow;

  @override
  Widget build(BuildContext context) {
    const int screenHeight = 932;
    const int screenWidth = 430;
    return Container(
      height: (height / screenHeight) * 100.h,
      width: (width / screenWidth) * 100.w,
      decoration: BoxDecoration(
        //  gradient: AppColor.gradientPrimary,
        borderRadius: BorderRadius.circular(8),
        boxShadow: boxShadow,
      ),
      child: MaterialButton(
        onPressed: function,
        child: TextWidget(
          text: text,
          size: textSize,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
