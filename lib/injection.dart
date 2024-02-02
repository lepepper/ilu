import 'package:ilu/app_router.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'bottom_navigation_bloc.dart';

final GetIt getIt = GetIt.instance;

///
///-----------GetIt Version----------------------
///

//void configureInjection(Environment environment, {required String environment}) {
// @InjectableInit()
// void configureInjection(Environment environment) {
//   getIt.registerSingleton<AppRouter>(AppRouter());
//   //getIt.init();
// }

///
///-----------Bloc Version----------------------
///
@InjectableInit()
void configureInjection(Environment environment) {
  getIt.registerSingleton<BottomNavigationBloc>(BottomNavigationBloc());
  //getIt.init();
}
