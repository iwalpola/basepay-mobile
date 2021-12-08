import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:basepay/ui/map.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BasePay',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MapScreen(),
    );
  }
}
