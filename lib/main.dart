import 'dart:io';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'data_Directory/data.dart';

void main() async {
  WidgetsFlutterBinding .ensureInitialized();
  var directory= await getApplicationDocumentsDirectory();
  String directoryPath=directory.path;
  Hive.init(directoryPath);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: homepage(),
    );
  }
}


