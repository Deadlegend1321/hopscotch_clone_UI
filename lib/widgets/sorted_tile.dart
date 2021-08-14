import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hopscotch/models/pagesort.dart';
import 'package:hopscotch/size_config.dart';
import 'package:provider/provider.dart';

class SortedTile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final tile = Provider.of<PageSort>(context);
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.fromLTRB(
          3*SizeConfig.widthMultiplier,
          0,
          3*SizeConfig.widthMultiplier,
          0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 4*SizeConfig.heightMultiplier,
            backgroundImage: NetworkImage(tile.imageUrl),
          ),
          Text(tile.name)
        ],
      ),
    );
  }
}
