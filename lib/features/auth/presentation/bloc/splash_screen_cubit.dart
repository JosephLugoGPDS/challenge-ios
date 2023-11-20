import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreenCubit extends Cubit<bool> {
  SplashScreenCubit() : super(false) {
    Timer(const Duration(seconds: 2), () => emit(true));
  }
}