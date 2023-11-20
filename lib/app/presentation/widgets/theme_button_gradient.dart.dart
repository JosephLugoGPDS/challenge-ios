import 'package:challenge/app/presentation/theme/app_theme.dart';
import 'package:challenge/core/utils/extensions/screen_extension.dart';
import 'package:flutter/material.dart';

class ThemeButtonGradient extends StatelessWidget {
  const ThemeButtonGradient({
    Key? key,
    required this.title,
    required this.onPressed,
    this.width,
    this.padding,
    this.background,
    this.disableColor,
    this.textColor,
    this.elevation = 2,
    this.margin,
    this.borderRadius,
    this.colors,
    this.boxShadow,
    this.height,
    this.styleTextButton,
  }) : super(key: key);
  final String title;
  final void Function()? onPressed;
  final EdgeInsets? padding;
  final Color? background;
  final Color? disableColor;
  final Color? textColor;
  final double? width;
  final double elevation;
  final EdgeInsets? margin;
  final double? borderRadius;
  final List<Color>? colors;
  final List<BoxShadow>? boxShadow;
  final double? height;
  final TextStyle? styleTextButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin ?? EdgeInsets.only(top: 8.h, left: 29.w, right: 29.w),
      decoration: BoxDecoration(
        boxShadow: boxShadow ??
            const [
              BoxShadow(
                color: Color.fromRGBO(90, 202, 250, 0.25),
                offset: Offset(0, 10),
                blurRadius: 15.0,
              ),
            ],
        gradient: LinearGradient(
          begin: const Alignment(-1, -1),
          end: const Alignment(1.4, 0),
          stops: const <double>[0.8, 1],
          colors: colors ?? [AppTheme.primaryColor, AppTheme.secondaryColor],
        ),
        // color: AppTheme.primaryColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          // minimumSize: MaterialStateProperty.all(Size(width ?? double.maxFinite, AppSizes.size50)),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          // elevation: MaterialStateProperty.all(3),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: padding ?? EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 10.h),
          child: Text(
            title,
            textAlign: TextAlign.center,
            maxLines: 1,
            style: styleTextButton ??
                TextStyle(
                  color: textColor ?? AppTheme.blackColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
      ),
    );
  }
}
