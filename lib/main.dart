// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

import 'package:weatherapp/view/homescreen.dart';
import 'package:weatherapp/view/onboardscreen.dart';

void main() async {
  await GetStorage.init();
  Widget? widget;
  if(GetStorage().read('onBoard') != null){
    widget = HomeScreen();
  }
  else{
    widget = const OnBoardScreen();
  }
  runApp(MyApp(startWidget: widget,));
}

class MyApp extends StatelessWidget {

    Widget startWidget;
  MyApp({
    Key? key,
    required this.startWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      splitScreenMode: false,
      builder: (context, child) => GetMaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: const TextTheme(
            bodyMedium: TextStyle(
              color: Colors.white,
            ),
            bodyLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.black)),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: startWidget,
    ),);
  }
}
