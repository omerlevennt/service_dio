import 'package:flutter/material.dart';
import 'package:service_dio/service/service_learn_view.dart';
import 'package:service_dio/service/service_post_learn_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const ServiceLearn(),
    );
  }
}
