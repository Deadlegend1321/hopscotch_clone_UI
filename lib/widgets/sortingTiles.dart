import 'package:flutter/material.dart';
import 'package:hopscotch/size_config.dart';
import 'package:hopscotch/widgets/sorted_tile.dart';
import 'package:provider/provider.dart';
import '../utils/data.dart';

class SortingTiles extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final sortingTilesData = Provider.of<Data>(context).items;
    return ListView.builder(
      itemCount: sortingTilesData.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) => ChangeNotifierProvider.value(
            value: sortingTilesData[index],
          child: SortedTile(),
        )
    );
  }
}
