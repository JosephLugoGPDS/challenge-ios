import 'package:challenge/app/presentation/routes/app_router.dart';
import 'package:challenge/app/presentation/theme/app_theme.dart';
import 'package:challenge/core/utils/extensions/screen_extension.dart';
import 'package:challenge/features/auth/presentation/bloc/login/auth_bloc.dart';
import 'package:challenge/gen/assets.gen.dart';
import 'package:challenge/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = context.l10n;
    context.read<AuthBloc>().add(const AuthCheckEvent());
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, stateAuthState) async {
          if (stateAuthState is AuthSuccessState) {
            //TODO: remove this delay
            await Future.delayed(const Duration(seconds: 1));
            Navigator.pushReplacementNamed(context, AppRoutes.homeScreen);
          } else {
            await Future.delayed(const Duration(seconds: 1));
            Navigator.pushReplacementNamed(context, AppRoutes.loginScreen);
          }
        },
        builder: (context, stateAuthState) {
          return CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Container(
                  color: AppTheme.barBackgroundColor,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          Assets.svg.brand,
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          l10n.app,
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
