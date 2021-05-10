import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_demo/src/controllers/incrementController.dart';
import 'package:provider/provider.dart';

/// Exemplo do increment utilizando a gerência de estado MOBX.
class MobxDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<IncrementController>(
          create: (_) => IncrementController(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Mobx Demo',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: MyHomePage(title: 'Mobx Demo'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final incrementController = Provider.of<IncrementController>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have clicked the button this many times:',
            ),
            Observer(
              builder: (_) => Text(
                '${incrementController.counter}',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: incrementController.increment,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
