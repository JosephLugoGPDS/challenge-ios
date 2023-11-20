import 'package:challenge/core/utils/generics/screen_util.dart';

extension ScreenExtension on num {
  double get w => ScreenUtil().setWidth(this) as double;

  double get h => ScreenUtil().setHeight(this) as double;

  double get sp => ScreenUtil().setSp(this) as double;
}