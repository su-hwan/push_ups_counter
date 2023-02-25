import 'package:flutter/material.dart';
import 'package:push_ups_counter/screen/main_screen.dart';
import 'package:push_ups_counter/config/values.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: MyStyle.mainBackgroundColor,
        focusColor: MyStyle.mainBackgroundColor,
      ),
      home: const MainScreen(),
    );
  }
}
