import 'package:ogurets/ogurets.dart';

import 'steps/CounterStepdefs.dart';


// THIS FILE IS GENERATED - it will be overwritten on each run.
// If you wish to use one, please just make a copy and use that.
// Your friendly Ogurets team - Irina Southwell & Richard Vowles
//  (and we hope supporting cast)
// if you have an issue please raise it on
// https://github.com/dart-ogurets/Ogurets (for core)
// https://github.com/dart-ogurets/OguretsFlutter (for ogurets_flutter)
// https://github.com/dart-ogurets/OguretsIntellij (for the Jetbrains IntelliJ plugin)
void main(args) async {
  var def = new OguretsOpts()
    ..feature('tests/features/counter.feature')
    ..step(CounterStepdefs)
    ..debug()
  ;

  await def.run();
}
