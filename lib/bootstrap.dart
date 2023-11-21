import 'dart:async';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:challenge/injector_container.dart' as di;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log('>>>>>${bloc.runtimeType} $change', name: 'on change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('#### ${bloc.runtimeType} $error $stackTrace ####', name: 'on error');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    // await di.init();
    await di.featAuth();
    await dotenv.load();
    await di.initApiClient();
    await di.featHome();

    // Run App
    // Run Zoned guard
    runApp(await builder());
    Bloc.observer = AppBlocObserver();
  },
      (error, StackTrace stack) async => FlutterError.reportError(
          FlutterErrorDetails(exception: error, stack: stack)));
}
