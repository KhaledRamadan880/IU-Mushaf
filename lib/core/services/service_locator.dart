import 'package:get_it/get_it.dart';
import 'package:iu_mushaf/core/imports/imports.dart';

final sl = GetIt.instance;
void initServiceLocator() {
  sl.registerLazySingleton(() => Cache());
}
