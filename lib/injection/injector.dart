import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:joplate/injection/injector.config.dart';

GetIt injector = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
Future configureDependencies() async => $initGetIt(injector);
