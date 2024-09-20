import 'package:get_it/get_it.dart';
import 'package:iu_mushaf/core/databases/cache/cache.dart';

final sl = GetIt.instance;
void initServiceLocator() {
//!external
  sl.registerLazySingleton(() => Cache());
}
