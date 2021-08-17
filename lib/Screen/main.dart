import 'package:durianmeters/Screen/registerScreen.dart';
import 'package:flutter/material.dart';

import 'loginScreen.dart';

void main() => runApp(MyApp());


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {

    // double width = MediaQuery.of(context).copyWith().size.width;
    // double height = MediaQuery.of(context).copyWith().size.height;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Durian Meter",
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.grey,
          )
      ),
      home: Scaffold(
        body: LoginScreen(),
      ),
    );
  }
}
