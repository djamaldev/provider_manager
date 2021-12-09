import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testprovider/Provider/counter_provider.dart';
import 'package:testprovider/Provider/language_provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var _lan = Provider.of<LanguageProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '${_lan.getTexts('reminder')}',
            ),
            Text(
              '${Provider.of<CounterProvider>(context).counter}',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FloatingActionButton(
            onPressed: () =>
                Provider.of<CounterProvider>(context, listen: false)
                    .incrementCounter(),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          Text('${_lan.getTexts('arabic')}'),
          Switch(
            value: _lan.isEn,
            onChanged: (val) => _lan.changeLan(val),
          ),
          Text('${_lan.getTexts('english')}'),
          FloatingActionButton(
            onPressed: () =>
                Provider.of<CounterProvider>(context, listen: false)
                    .decrementCounter(),
            tooltip: 'Increment',
            child: const Icon(Icons.minimize),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
