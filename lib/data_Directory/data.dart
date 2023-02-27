import 'dart:io';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class hive{
   data() async {
    Directory directory= await getApplicationDocumentsDirectory();
    String directoryPath=directory.path;
    Hive.init(directoryPath);
    print(directoryPath);
    return directoryPath;
  }
}