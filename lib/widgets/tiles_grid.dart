import 'package:flutter/material.dart';
import 'package:hopscotch/models/pagecomponents.dart';
import 'package:provider/provider.dart';
import '../size_config.dart';
import '../utils/components_data.dart';
import '../widgets/component_item.dart';

class TilesGrid extends StatelessWidget {
  final int pos;

  TilesGrid(this.pos);

  @override
  Widget build(BuildContext context) {
    final components = Provider.of<ComponentsData>(context).list;
    int len = 0, count = 1, index;
    List<PageComponents> subList = [];
    for(int i = 0; i<components.length-1; i++){
      if(pos == components[i].position && pos == components[i+1].position){
          if(components[i].width == components[i+1].width)
          {
            subList.add(components[i]);
            len++;
            index = i+1;
          }
          else{
            continue;
          }
      }
    }
    len = len+1;
    subList.add(components[index]);
    if(len==12 || len==6 || len==3){
      count = 3;
    }
    else if(len==2){
      count = 2;
    }
    else if(len>2 && len%2==0){
      count = len~/2;
    }
    SizeConfig().init(context);
      return Container(
        height: components[index].height/1.5,
        child: Flex(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          direction: Axis.vertical,
          verticalDirection: VerticalDirection.down,
          children: [
            Flexible(
              fit: FlexFit.loose,
              flex: 1,
              child: GridView.count(
                crossAxisCount: count,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
                childAspectRatio: 1,
                shrinkWrap: true,
                children: List.generate(
                    len,
                        (i) => ComponentItem(
                            subList[i].imageUrl,
                            subList[i].height
                        )
                ),
              ),
            ),
          ],
        ),
      );
  }
}
