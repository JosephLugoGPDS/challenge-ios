import 'package:challenge/app/presentation/theme/app_theme.dart';
import 'package:challenge/core/utils/extensions/screen_extension.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ThemeButtonLoader extends StatelessWidget {
  const ThemeButtonLoader({
    Key? key,
    this.width,
  }) : super(key: key);

  final double? width;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppTheme.grayDarkColor,
      highlightColor: AppTheme.grayColor,
      child: Container(
        width: width,
        margin: EdgeInsets.only(top: 8.h, left: 29.w, right: 29.w),
        decoration: BoxDecoration(
          color: AppTheme.blackColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            shadowColor: MaterialStateProperty.all(Colors.transparent),
          ),
          onPressed: null,
          child: Padding(
            padding: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 10.h),
            child: Text(
              'pressed',
              textAlign: TextAlign.center,
              maxLines: 1,
              style: TextStyle(
                color: AppTheme.blackColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
