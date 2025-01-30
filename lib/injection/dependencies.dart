import 'package:joplate/injection/injector.dart';

class DependencyManager {
  static Future<void> inject() async {
    await configureDependencies();
  }
}
