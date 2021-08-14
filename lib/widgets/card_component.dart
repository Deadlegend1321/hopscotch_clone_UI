import 'package:flutter/material.dart';
import 'package:hopscotch/models/pagecomponents.dart';
import '../size_config.dart';

class CardComponent extends StatelessWidget {
  final PageComponents poge;

  CardComponent(this.poge);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(2*SizeConfig.heightMultiplier),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(2*SizeConfig.heightMultiplier)),
        child: Card(
          elevation: 3,
          shadowColor: Color.fromRGBO(236, 83, 165, 1),
          child: FadeInImage(
            image: NetworkImage(poge.imageUrl),
            placeholder: AssetImage('assets/white.jpg'),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
