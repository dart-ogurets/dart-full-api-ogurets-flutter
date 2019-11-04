import 'package:flutter_driver/flutter_driver.dart';
import 'package:ogurets/ogurets.dart';
import 'package:ogurets_flutter/ogurets_flutter.dart';
import '../steps/shared.dart';

class OguSteps {
  FlutterOgurets _world;
  Shared shared;

  OguSteps(this._world, this.shared);

  @Given(r'I refresh the counter')
  void iRefreshTheCounter() {
    shared.refreshCounter();
  }

  @Given(r'I expect the counter to be {string}')
  void iExpectTheToBe(String input) async {
    final locator = find.byValueKey('counter');
    var text =
        await _world.driver.getText(locator, timeout: Duration(seconds: 2));
    assert(input == text, 'Counter should be $input but was $text');
  }

  @When(r'I tap the plus button {int} times')
  void iTapTheButtonTimes(int input) async {
    final locator = find.byValueKey('increment');
    for (var i = 0; i < input; i += 1) {
      await _world.driver.tap(locator);
    }
  }
}
