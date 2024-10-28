import 'package:flutter/material.dart';


class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
    required this.text,
    this.color = Colors.black,
    this.size = 14,
    this.maxLines = 10,
    this.height = 1.0,
    this.fontWeight = FontWeight.w400,
    this.isTitle = false,
    this.underLine = false,
    this.textAlign,
    this.width,
    this.textScaler,
  });
  final String text;
  final Color color;
  final double size;
  final double height;
  final double? width;
  final TextScaler? textScaler;
  final bool isTitle;
  final bool underLine;
  final int maxLines;
  final FontWeight fontWeight;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Text(
        text.toTitleCase(),
        maxLines: maxLines,
        textAlign: textAlign,
        textScaler: textScaler,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          decoration: underLine ? TextDecoration.underline : null,
          fontSize: isTitle ? 18 : size,
          color: color,
          height: height,
          overflow: TextOverflow.ellipsis,
          fontFamily: 'BalooBhaijaan2',
          fontWeight: isTitle ? FontWeight.bold : fontWeight,
        //  letterSpacing: Intl.getCurrentLocale() == 'en'
             // ?  0.8 : 0,
        ),
      ),
    );
  }
}

extension StringCasingExtension on String {
  String toCapitalized() => length > 0 ?'${this[0].toUpperCase()}${substring(1).toLowerCase()}':'';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.toCapitalized()).join(' ');
}