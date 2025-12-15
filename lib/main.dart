import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:prajyotpawar/ui/home/home.dart';
import 'package:prajyotpawar/utils/screen/screen_utils.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      scrollBehavior: const MaterialScrollBehavior().copyWith(scrollbars: false),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.light,
      ),
      home: MyAppChild(),
    );
  }
}

class MyAppChild extends StatefulWidget {

  @override
  _MyAppChildState createState() => _MyAppChildState();
}

class _MyAppChildState extends State<MyAppChild> {


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ScreenUtil.getInstance().init(context);
  }

  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}
