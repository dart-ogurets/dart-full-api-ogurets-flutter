import 'package:flutter_driver/flutter_driver.dart';
import 'package:ogurets_flutter/ogurets_flutter.dart';

class Shared {
  FlutterOgurets _world;
  Shared(this._world);

  void refreshCounter() async {
    final locator = find.byValueKey('reset');
    await _world.driver.tap(locator);
    print('Reset counter');
  }
}
