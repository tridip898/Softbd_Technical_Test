import 'package:flutter/material.dart';
import 'package:flutter_tchnical_test/screen/first_page.dart';
import 'package:flutter_tchnical_test/screen/second_page.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context,orientation,deviceType){
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/second',
        getPages: [
          GetPage(name: '/', page: ()=>FirstPage()),
          GetPage(name: '/second', page: ()=>SecondPage()),
        ],
      );
    });
  }
}
