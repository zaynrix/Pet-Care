import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveService{

initHive() async {
  await Hive.initFlutter();
}
}