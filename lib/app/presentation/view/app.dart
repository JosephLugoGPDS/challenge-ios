
import 'package:challenge/app/presentation/routes/app_router.dart';
import 'package:challenge/app/presentation/theme/app_theme.dart';
import 'package:challenge/core/utils/generics/screen_util.dart';
import 'package:challenge/features/auth/presentation/bloc/login/auth_bloc.dart';
import 'package:challenge/features/auth/presentation/view/splash_screen.dart';
import 'package:challenge/l10n/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:challenge/injector_container.dart' as di;
import 'package:flutter_localizations/flutter_localizations.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (_) => di.sl<AuthBloc>()),
      ],
      child: CupertinoApp(
        navigatorKey: navigatorKey,
        theme: AppTheme.themeMobile(context),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        routes: AppRoutes.routes,
        home: Builder(
          builder: (contextBuilder) {
            ScreenUtil.init(
              allowFontScaling: true,
            );
            return const SplashScreen();
          },
        ),
        supportedLocales: AppLocalizations.supportedLocales,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
