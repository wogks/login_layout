import 'package:flutter/material.dart';
import 'package:login_layout/presentation/auth_screen/auth_screen.dart';
import 'package:login_layout/util/screen_provider.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  static const String pageName = 'MyHomeScreen';

  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<ScreenNotifier>(context, listen: false)
                  .goToOtherPage(AuthScreen.pageName);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
