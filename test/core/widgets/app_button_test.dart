import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_flutter_template/core/widgets/app_button.dart';

void main() {
  testWidgets('AppButton renders its title and handles taps', (tester) async {
    var tapCount = 0;

    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => MaterialApp(
          home: Scaffold(
            body: AppButton(title: 'Continue', onTab: () => tapCount++),
          ),
        ),
      ),
    );

    expect(find.text('Continue'), findsOneWidget);
    expect(tapCount, 0);

    await tester.tap(find.byType(TextButton));
    await tester.pump();

    expect(tapCount, 1);
  });
}
