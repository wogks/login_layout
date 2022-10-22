import 'package:flutter/material.dart';

import 'presentation/my_home_screen/my_home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Navigator(
        pages: [
          MaterialPage(
            key: ValueKey(MyHomePage.pageName),
            child: const MyHomePage(title: 'Flutter Demo Home Page'),
          ),
        ],
        onPopPage: (route, result) {
          if (!route.didPop(result)) {
            return false;
          }
          return true;
        },
      ),
    );
  }
}
