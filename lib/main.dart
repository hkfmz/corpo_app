import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'ui/operatuer/log_in.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Sizer(builder: (context, orientation, screenType) {
      return GetMaterialApp(                 // GetX
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Sofia-Pro-Light',
          primarySwatch: Colors.pink,
        ),
        home: LogIn(),
      );
    });
  }
}
