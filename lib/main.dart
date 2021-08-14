import 'package:flutter/material.dart';
import 'package:hopscotch/screens/home.dart';
import 'package:hopscotch/utils/components_data.dart';
import 'package:hopscotch/utils/data.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => Data()
        ),
        ChangeNotifierProvider(
          create: (_) => ComponentsData(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }



}

