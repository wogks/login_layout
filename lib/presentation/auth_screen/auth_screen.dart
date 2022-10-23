import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../util/screen_provider.dart';

class AuthScreen extends Page {
  static const pageName = 'AuthScreen';
  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,//기본 셋팅일때는 this
      builder: (context) => const AuthWidget(),
    );
  }
}

class AuthWidget extends StatefulWidget {
  const AuthWidget({super.key});

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
                Provider.of<ScreenNotifier>(context, listen: false)
                    .goToMain();
              },
        child: Container(
          color: Colors.amberAccent,
        ),
      ),
    );
  }
}
