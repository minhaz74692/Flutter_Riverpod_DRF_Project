import 'package:drf_flutter_app/app.dart';
import 'package:flutter/material.dart';
import 'di_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(
    MyApp(),
  );
}
