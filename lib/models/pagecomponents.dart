import 'package:flutter/foundation.dart';

class PageComponents with ChangeNotifier{
  int position;
  String imageUrl;
  int height;
  int width;

  PageComponents({
    @required this.position,
    @required this.imageUrl,
    @required this.height,
    @required this.width,
  });



}

