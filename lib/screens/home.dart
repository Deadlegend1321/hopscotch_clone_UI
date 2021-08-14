import 'package:flutter/material.dart';
import 'package:hopscotch/utils/components_data.dart';
import 'package:hopscotch/widgets/card_component.dart';
import 'package:hopscotch/widgets/sortingTiles.dart';
import 'package:hopscotch/widgets/tiles_grid.dart';
import '../utils/data.dart';
import '../size_config.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool selected = false;
  bool visible = false;

  @override
  void initState() {
    Provider.of<Data>(context, listen: false).gettingData();
    Provider.of<ComponentsData>(context, listen: false).gettingComponentsData();
    Future.delayed(
        const Duration(
            milliseconds: 6000), () {
          setState(() {
            visible = true;
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    var comp = Provider.of<ComponentsData>(context).list;
    SizeConfig().init(context);
    return visible ?Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(236, 83, 165, 1),
        title: Row(
          children: [
            Image(
              height: 20*SizeConfig.heightMultiplier,
              width: 20*SizeConfig.widthMultiplier,
              image: AssetImage('assets/hs.jpg'),
            ),
            Padding(
              padding: EdgeInsets.only(left: 2*SizeConfig.heightMultiplier,top: 2*SizeConfig.heightMultiplier),
              child: Text(
                'Account',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 1.5*SizeConfig.textMultiplier
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 2*SizeConfig.heightMultiplier,top: 2*SizeConfig.heightMultiplier),
              child: Text(
                'Help',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 1.5*SizeConfig.textMultiplier
                ),
              ),
            )
          ],
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.search_outlined),
              color: Colors.white,
              onPressed: (){}
          ),
          IconButton(
              icon: Icon(Icons.bookmark_border_outlined),
              color: Colors.white,
              onPressed: (){}
          ),
          IconButton(
              icon: Icon(Icons.shopping_cart_outlined),
              color: Colors.white,
              onPressed: (){}
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                    padding: EdgeInsets.only(
                        top: 15*SizeConfig.heightMultiplier
                    )
                ),
                CardComponent(comp[0]),
                TilesGrid(2),
                CardComponent(comp[7]),
                CardComponent(comp[8]),
                TilesGrid(4),
                CardComponent(comp[12]),
                TilesGrid(5),
                CardComponent(comp[19]),
                TilesGrid(6),
                CardComponent(comp[32]),
                TilesGrid(7),
                CardComponent(comp[39]),
                TilesGrid(8),
                CardComponent(comp[44]),
                CardComponent(comp[45]),
                CardComponent(comp[46]),
                CardComponent(comp[47]),
                CardComponent(comp[48]),
                CardComponent(comp[49]),
                TilesGrid(13),
                CardComponent(comp[53]),
                TilesGrid(14),
                CardComponent(comp[57]),
                CardComponent(comp[58]),
                CardComponent(comp[59]),
                CardComponent(comp[60]),
                CardComponent(comp[61]),
                CardComponent(comp[62]),
                CardComponent(comp[63]),
                CardComponent(comp[64]),
                CardComponent(comp[65]),
                CardComponent(comp[66]),
                CardComponent(comp[67]),
                CardComponent(comp[68]),
                CardComponent(comp[69]),
                TilesGrid(21),
                CardComponent(comp[73]),
                CardComponent(comp[74]),
                CardComponent(comp[75]),
                CardComponent(comp[76]),
                CardComponent(comp[77]),
                CardComponent(comp[78]),
                CardComponent(comp[79]),
                CardComponent(comp[80]),
                TilesGrid(27),
                CardComponent(comp[85]),
                CardComponent(comp[86]),
                CardComponent(comp[87]),
                CardComponent(comp[88]),
                CardComponent(comp[89]),
                TilesGrid(29),
              ],
            ),
            SizedBox(
              height: 32*SizeConfig.heightMultiplier,
              width: SizeConfig.screenWidth,
              child: Stack(
                children: [
                  AnimatedPositioned(
                    height: 14*SizeConfig.heightMultiplier,
                      width: SizeConfig.screenWidth,
                      child: Container(
                        padding: EdgeInsets.only(top: 2*SizeConfig.heightMultiplier),
                        color: Colors.white,
                        child: SortingTiles(),
                      ),
                      duration: Duration(milliseconds: 500),
                    curve: Curves.bounceOut,
                    top: selected ? 14*SizeConfig.heightMultiplier : 0,
                  ),
                  Positioned(
                    height: 14*SizeConfig.heightMultiplier,
                    width: SizeConfig.screenWidth,
                    top: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5.0,
                        ),]
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                              'Discover',
                            style: TextStyle(
                              color: Color.fromRGBO(236, 83, 165, 1),
                                fontWeight: FontWeight.bold,
                              fontSize: 2*SizeConfig.textMultiplier
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selected = !selected;
                              });
                            },
                            child: Row(
                              children: [
                                Text(
                                    'All',
                                  style: TextStyle(
                                    color: Color.fromRGBO(236, 83, 165, 1),
                                      fontSize: 2*SizeConfig.textMultiplier
                                  ),
                                ),
                                Icon(
                                    selected ? Icons.keyboard_arrow_up_sharp :Icons.keyboard_arrow_down_sharp,
                                  color: Color.fromRGBO(236, 83, 165, 1),
                                )
                              ],
                            ),
                          ),
                          Text(
                              'Categories',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 2*SizeConfig.textMultiplier
                            ),
                          ),
                          Text(
                              'Moments',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                                fontSize: 2*SizeConfig.textMultiplier
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      )
    ) : Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.white,
      child: Center(
          child: CircularProgressIndicator(
            backgroundColor: Color.fromRGBO(236, 83, 165, 1),
          )
      ),
    );
  }

  /*Widget check(int pos){
    var components = Provider.of<ComponentsData>(context).list;
    int len = 0;
    List<PageComponents> subList = [];
    for(int i = 0; i<components.length; i++){
      if(pos == components[i].position){
        if(i!=0)
        {
          if(
          components[i].width != components[i+1].width &&
              components[i-1].width != components[i].width
          ){
            subList.add(components[i]);
            len++;
          }
        }
        else{
          if(components[i].width != components[i+1].width){
            subList.add(components[i]);
            len++;
          }
        }
      }
    }
    for(int j = 0;j<len;j++){
      return CardComponent(subList[j]);
    }
  }*/
}
