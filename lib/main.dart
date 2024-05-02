import 'package:flutter/material.dart';
import 'package:jint/core/theme/themeData/themeDataDark.dart';
import 'package:jint/core/utils/App_String.dart';
import 'package:jint/core/utils/local_preferences.dart';
import 'package:jint/jint/presentation/components/splash_view.dart';
import 'package:jint/jint/presentation/s.dart';
import 'package:jint/jint/presentation/screens/login/login_screen.dart';
import 'package:bloc/bloc.dart';

import 'core/services/services_locator.dart';

void main() async{
  ServicesLocator().init();
 WidgetsFlutterBinding.ensureInitialized();
 await LocalPreferences.init();

  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppString.appName,
      theme:  getThemeDataDark(),
      home:  LoginScreen(),
    );
  }
}

class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    debugPrint('onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    debugPrint('onChange -- ${bloc.runtimeType}, $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    debugPrint('onError -- ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    debugPrint('onClose -- ${bloc.runtimeType}');
  }
}
