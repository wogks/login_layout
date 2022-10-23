import 'package:flutter/material.dart';
import 'package:login_layout/presentation/auth_screen/auth_screen.dart';
import 'package:login_layout/util/screen_provider.dart';
import 'package:provider/provider.dart';

import 'presentation/my_home_screen/my_home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_)=>ScreenNotifier())],
      child: MaterialApp(
        title: 'Flutter Demo',
        home: Consumer<ScreenNotifier>(
          builder: (context, screenNotifier, child) {
            return Navigator(
            pages: [
              const MaterialPage(
                key: ValueKey(MyHomePage.pageName),
                child: MyHomePage(title: 'Flutter Demo Home Page'),
              ),
              if(screenNotifier.currentPage == AuthScreen.pageName)AuthScreen(),
            ],
            onPopPage: (route, result) {
              if (!route.didPop(result)) {
                return false;
              }
              return true;
            },
          );
          },
          
        ),
      ),
    );
  }
}
