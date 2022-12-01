import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:arawinzhilo/Packages/CommonAssets/Colors.dart';
import 'package:arawinzhilo/Packages/CommonAssets/TextStyle.dart';

import '../../../Widgets/Text.dart';

class SplashPage extends StatelessWidget {
 


  @override
  Widget build(BuildContext context) {
   return Scaffold(
    backgroundColor: color.primary,
     body: Center(child: text(data: "Hilo",style: Text_Style.Heading,)),
   );
  }
}