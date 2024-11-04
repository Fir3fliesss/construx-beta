import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  double height;
  int? maxLine;
  TextOverflow? overFlow;
  FontWeight? fontWeight;
  TextAlign? textAlign;

  SmallText(
      {Key? key,
      this.color = const Color(0xFF575F6E),
      required this.text,
      this.size = 12,
      this.height = 1.2,
      this.overFlow,
      this.maxLine,
      this.fontWeight = FontWeight.w400,
      this.textAlign = TextAlign.center})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLine,
      overflow: overFlow,
      style: TextStyle(
        color: color,
        fontSize: size,
        height: height,
        fontWeight: fontWeight,
      ),
    );
  }
}
