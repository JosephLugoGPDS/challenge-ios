import 'package:challenge/app/presentation/theme/app_theme.dart';
import 'package:flutter/material.dart';


class CardContainer extends StatelessWidget {
  const CardContainer({
    Key? key,
    required this.children,
    this.color,
    this.elevation = 0,
    this.crossAxisAlignment,
    this.mainAxisAlignment,
    this.margin = const EdgeInsets.all(5),
    this.padding = const EdgeInsets.all(5),
    this.borderColor = Colors.transparent,
    this.borderRadius = 5,
    this.boxShadow,
    this.width,
    this.height,
  }): super (key: key);

  final List<Widget> children;
  final Color? color;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final double elevation;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisAlignment? mainAxisAlignment;
  final Color borderColor;
  final double borderRadius;
  final List<BoxShadow>? boxShadow;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        boxShadow: boxShadow ?? [
          const BoxShadow(
                    offset: Offset(0, 6),
                    blurRadius: 6,
                    color: Color.fromRGBO(0, 0, 0, 0.1),
                  ),
        ]
      ),
      child: Card(
        color: color ?? AppTheme.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        elevation: elevation,
        child: Container(
          padding: EdgeInsets.zero,
          margin: EdgeInsets.zero,
          decoration: BoxDecoration(
            border: Border.all(
              color: borderColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Padding(
            padding: padding,
            child: Column(
              mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
              crossAxisAlignment:
                  crossAxisAlignment ?? CrossAxisAlignment.stretch,
              children: children,
            ),
          ),
        ),
      ),
    );
  }
}
