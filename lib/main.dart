import 'package:flutter/material.dart';
import 'package:pr2_sky_scrapper_app/screens/covid_case_screen.dart';

void main(){

  runApp(const MyApp());

}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CoronaCasesScreen(),
    );
  }
}
