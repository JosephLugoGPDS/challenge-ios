import 'package:challenge/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

extension PumpApp on WidgetTester {
  Future<void> pumpApp(Widget widget) async {
    await pumpWidget(
      MaterialApp(
        home: widget,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );
  }
}
