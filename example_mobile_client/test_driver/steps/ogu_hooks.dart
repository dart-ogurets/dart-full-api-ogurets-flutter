import 'package:ogurets/ogurets.dart';
import '../steps/shared.dart';

class Hooks {
  Shared shared;
  Hooks(this.shared);

  @Before(tag: 'reset_counter')
  void beforeExpression() {
    shared.refreshCounter();
  }
}
