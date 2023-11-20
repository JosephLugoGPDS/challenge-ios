import 'package:challenge/app/presentation/theme/app_theme.dart';
import 'package:challenge/core/utils/extensions/screen_extension.dart';
import 'package:flutter/material.dart';

class LoaderDialog extends StatelessWidget {
  const LoaderDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: 21.w,
      height: 21.h,
      child: const Center(
        child: CircularProgressIndicator(
            strokeWidth: 6, color: AppTheme.primaryColor),
      ),
    );
  }
}
