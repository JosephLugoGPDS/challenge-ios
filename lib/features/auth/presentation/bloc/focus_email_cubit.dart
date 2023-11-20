import 'package:flutter_bloc/flutter_bloc.dart';

class FocusValidation extends Cubit<bool> {
  FocusValidation() : super(false);

  void focus() => emit(true);
  void unfocus() => emit(false);
}