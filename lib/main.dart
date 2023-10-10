import 'package:clock_12/utls1/homepage.dart';
import 'package:flutter/material.dart';
import 'MyRoutes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      routes: {
        MyRoutes.homepage: (context) => const homepage(),
      },
      theme: ThemeData(
          //  useMaterial: true,
          ),
    );
  }
}
