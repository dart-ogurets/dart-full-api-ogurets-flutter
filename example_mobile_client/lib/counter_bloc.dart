import 'dart:async';
import 'package:counterapi/api.dart';
import 'package:example_mobile_client/client.dart';
import 'package:rxdart/rxdart.dart' as rxdart;

class CounterBloc {
  final Client client;

  Counter _counter;
  final _counterStream = rxdart.BehaviorSubject<Counter>();
  Stream<Counter> get counter => _counterStream.stream;

  //constructor
  CounterBloc(this.client) {
    initialise();
  }

  void initialise() async {
    await getCounter();
  }

  void dispose() {
    _counterStream.close();
  }

  getCounter() async {
    _counter = await client.counterServiceApi.getCounter();
    if (_counter == null) {
      _counter = new Counter()..amount = 0;
    }
    _counterStream.add(_counter);
  }

  counterInc() async {
    Counter cnt = new Counter()..amount = 1;
    _counter = await client.counterServiceApi.incCounter(cnt);
    _counterStream.add(_counter);
  }

  counterReset() async {
    _counter = await client.counterServiceApi.resetCounter();
    _counterStream.add(_counter);
  }
}
