import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tomato/router/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '番茄漫画',
      getPages: AppPages.getPages,
      initialRoute: App.HOME,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
