import 'package:flutter/material.dart';
import '../size_config.dart';

class ComponentItem extends StatelessWidget {
  final String url;
  final int height;

  ComponentItem(this.url, this.height);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height*1.0,
      width: height*1.0,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(2*SizeConfig.heightMultiplier)),
      ),
      child: FadeInImage(
        alignment: Alignment.center,
        height: 2*SizeConfig.heightMultiplier,
        width: 2*SizeConfig.widthMultiplier,
        image: NetworkImage(url),
        placeholder: AssetImage('assets/white.jpg'),
        fit: BoxFit.contain,
      ),
    );
  }
}
