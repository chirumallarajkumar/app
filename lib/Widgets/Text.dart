

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:arawinzhilo/Packages/CommonAssets/TextStyle.dart';

class text extends StatelessWidget {
  final String data;
  final TextStyle style;
 text( { required this.data,required this.style});

  @override
  Widget build(BuildContext context) {
    return Text(data,style: style);
  }
}