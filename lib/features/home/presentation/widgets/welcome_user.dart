import 'package:challenge/app/presentation/theme/app_theme.dart';
import 'package:challenge/core/utils/extensions/screen_extension.dart';
import 'package:challenge/features/auth/presentation/bloc/login/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeUser extends StatelessWidget {
  const WelcomeUser({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return context.read<AuthBloc>().state is AuthSuccessState
        ? Text(
            'Welcome ${(context.read<AuthBloc>().state as AuthSuccessState).user.name}',
            style: TextStyle(
              color: AppTheme.whiteColor,
              fontSize: 16.sp,
            ),
          )
        : const SizedBox();
  }
}
