import 'package:flutter/material.dart';
import '../Packages/CommonAssets/TextStyle.dart';
import 'Text.dart';
import 'package:arawinzhilo/Packages/CommonAssets/Colors.dart';

class button extends StatelessWidget {
  final Alignment alignment;
  final double height;
  final double width;
  final double radius;
  final Color ContainerColor;
  final Color borderColor;
  final String buttontext;
  final TextStyle buttontextStyle;

  button(
      {required this.alignment,
      required this.height,
      required this.width,
      required this.radius,
      required this.ContainerColor,
      required this.borderColor,
      required this.buttontext,
      required this.buttontextStyle});
  @override
  Widget build(BuildContext context) {
    return Container(
      
      alignment: alignment,
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: ContainerColor,
        border: Border.all(
          color: borderColor,
        ),
        borderRadius: BorderRadius.all(Radius.circular(radius)),
      ),
      child: text(data: buttontext, style: buttontextStyle),
    );
  }
}
