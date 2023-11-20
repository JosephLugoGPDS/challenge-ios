import 'package:challenge/app/presentation/routes/app_router.dart';
import 'package:challenge/app/presentation/theme/app_theme.dart';
import 'package:challenge/app/presentation/widgets/card_container.dart';
import 'package:challenge/app/presentation/widgets/loader_dialog.dart';
import 'package:challenge/app/presentation/widgets/theme_button_gradient.dart.dart';
import 'package:challenge/core/utils/extensions/screen_extension.dart';
import 'package:challenge/features/auth/presentation/bloc/login/auth_bloc.dart';
import 'package:challenge/features/auth/presentation/widget/custom_text_form_field.dart';
import 'package:challenge/gen/assets.gen.dart';
import 'package:challenge/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    final AppLocalizations l10n = context.l10n;
    return ScaffoldMessenger(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              child: Container(
                padding:
                    EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 16.0.h),
                color: AppTheme.barBackgroundColor,
                child: BlocListener<AuthBloc, AuthState>(
                  listener: (context, stateAuthState) {
                    if (stateAuthState is AuthFailureState) {
                      Navigator.of(context).pop();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(stateAuthState.errorMessage),
                          backgroundColor: AppTheme.redColor,
                        ),
                      );
                    }
                    if (stateAuthState is AuthLoadingState) {
                      showDialog(
                          barrierDismissible: false,
                          barrierColor: Colors.transparent,
                          context: context,
                          builder: (_) {
                            return const LoaderDialog();
                          });
                    }
                    if (stateAuthState is AuthSuccessState) {
                      Navigator.of(context).pop();
                      Navigator.pushNamedAndRemoveUntil(
                          context, AppRoutes.homeScreen, (route) => false);
                    }
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        Assets.svg.brand,
                      ),
                      SizedBox(height: 16.h),
                      CardContainer(
                        margin:
                            EdgeInsets.only(top: 30.h, left: 29.w, right: 29.w),
                        padding: EdgeInsets.only(
                            top: 4.h, bottom: 7.h, left: 16.w, right: 16.w),
                        children: [
                          CustomTextFormField(
                            controller: emailController,
                            onChanged: (value) {},
                            hint: l10n.user,
                            textInputAction: TextInputAction.next,
                          ),
                        ],
                      ),
                      CardContainer(
                        margin:
                            EdgeInsets.only(top: 8.h, left: 29.w, right: 29.w),
                        padding: EdgeInsets.only(
                            top: 4.h, bottom: 7.h, left: 16.w, right: 16.w),
                        children: [
                          CustomTextFormField(
                            controller: passwordController,
                            onChanged: (value) {},
                            hint: l10n.password,
                            textInputAction: TextInputAction.done,
                            obscureText: true,
                          ),
                        ],
                      ),
                      SizedBox(height: 16.0.h),
                      ThemeButtonGradient(
                        width: double.maxFinite,
                        onPressed: () => context.read<AuthBloc>().add(
                            GetLoginEvent(
                                emailController.text, passwordController.text)),
                        title: l10n.login,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
