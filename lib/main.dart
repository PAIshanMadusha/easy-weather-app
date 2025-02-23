import 'package:easy_weather_app/pages/home_page.dart';
import 'package:easy_weather_app/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

Future main() async{

  await dotenv.load(fileName: ".env");

  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: MyApp(),),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Easy Weather",
      theme: Provider.of<ThemeProvider>(context).getThemeData,
      home: HomePage(),
    );
  }
}