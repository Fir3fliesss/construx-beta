import '../utils/color.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BigText extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  double? height;
  int? maxLine;
  TextOverflow? overFlow;
  TextAlign textAlign;
  FontWeight? fontWeight;

  BigText(
      {Key? key,
      this.color = ColorsCustom.textBlack,
      required this.text,
      this.overFlow,
      this.maxLine,
      this.height,
      this.textAlign = TextAlign.center,
      this.fontWeight = FontWeight.w700,
      this.size = 24})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        maxLines: maxLine,
        overflow: overFlow,
        textAlign: textAlign,
        style: TextStyle(
          color: color,
          fontWeight: fontWeight,
          fontSize: size,
          height: height,
        ));
  }
}
