import 'package:flutter/material.dart';
import 'package:flutter_projects/provider/dataprovider.dart';
import 'package:flutter_projects/view/home/categories.dart';
import 'package:provider/provider.dart';
import 'provider/providerscreen.dart';
import 'view/home/homescreen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (ctx)=>providerscreen()),
    ChangeNotifierProvider(create: (ctx)=>dataprovider())
  ]
    ,child: const MyApp(),) );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: categories(),
    );
  }
}

