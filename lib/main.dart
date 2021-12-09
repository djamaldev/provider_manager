import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testprovider/Provider/counter_provider.dart';
import 'package:testprovider/Provider/language_provider.dart';

import 'Pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (ctx) => CounterProvider(),
          ),
          ChangeNotifierProvider(
            create: (ctx) => LanguageProvider(),
          ),
        ],
        child: const MyHomePage(title: 'Test'),
      ),
    );
  }
}
