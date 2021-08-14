import 'package:flutter/foundation.dart';

class PageSort with ChangeNotifier{
  bool isSelected;
  String name;
  String imageUrl;

  PageSort({
    @required this.isSelected,
    @required this.name,
    @required this.imageUrl
  });
}