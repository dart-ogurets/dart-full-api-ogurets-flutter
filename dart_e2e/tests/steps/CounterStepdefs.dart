import 'package:app_singleapp/common.dart';
import 'package:counterapi/api.dart';
import 'package:ogurets/ogurets.dart';


class CounterStepdefs {
  final Common common;

  CounterStepdefs(this.common);

  @Given(r'I reset the counter')
  void iResetTheCounter() async {
    await common.counterServiceApi.resetCounter();
  }

  @When(r'I increase it by {int}')
  void iIncreaseItBy(int val) async {
    await common.counterServiceApi.incCounter(Counter()..amount = val);
  }

  @Then(r'It should have a value of {int}')
  void itShouldHaveAValueOf(int val) async {
    await common.counterServiceApi.getCounter() == val;
  }
}
